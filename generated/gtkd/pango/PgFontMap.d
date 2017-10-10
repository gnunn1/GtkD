/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module pango.PgFontMap;

private import glib.Str;
private import gobject.ObjectG;
public  import gtkc.pangotypes;
private import pango.PgContext;
private import pango.PgFont;
private import pango.PgFontDescription;
private import pango.PgFontFamily;
private import pango.PgFontset;
private import pango.PgLanguage;
private import pango.c.functions;
public  import pango.c.types;


/**
 * The #PangoFontMap represents the set of fonts available for a
 * particular rendering system. This is a virtual object with
 * implementations being specific to particular rendering systems.  To
 * create an implementation of a #PangoFontMap, the rendering-system
 * specific code should allocate a larger structure that contains a nested
 * #PangoFontMap, fill in the <structfield>klass</structfield> member of the nested #PangoFontMap with a
 * pointer to a appropriate #PangoFontMapClass, then call
 * pango_font_map_init() on the structure.
 * 
 * The #PangoFontMap structure contains one member which the implementation
 * fills in.
 */
public class PgFontMap : ObjectG
{
	/** the main Gtk struct */
	protected PangoFontMap* pangoFontMap;

	/** Get the main Gtk struct */
	public PangoFontMap* getPgFontMapStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return pangoFontMap;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoFontMap;
	}

	protected override void setStruct(GObject* obj)
	{
		pangoFontMap = cast(PangoFontMap*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoFontMap* pangoFontMap, bool ownedRef = false)
	{
		this.pangoFontMap = pangoFontMap;
		super(cast(GObject*)pangoFontMap, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return pango_font_map_get_type();
	}

	/**
	 * Forces a change in the context, which will cause any #PangoContext
	 * using this fontmap to change.
	 *
	 * This function is only useful when implementing a new backend
	 * for Pango, something applications won't do. Backends should
	 * call this function if they have attached extra data to the context
	 * and such data is changed.
	 *
	 * Since: 1.34
	 */
	public void changed()
	{
		pango_font_map_changed(pangoFontMap);
	}

	/**
	 * Creates a #PangoContext connected to @fontmap.  This is equivalent
	 * to pango_context_new() followed by pango_context_set_font_map().
	 *
	 * If you are using Pango as part of a higher-level system,
	 * that system may have it's own way of create a #PangoContext.
	 * For instance, the GTK+ toolkit has, among others,
	 * gdk_pango_context_get_for_screen(), and
	 * gtk_widget_get_pango_context().  Use those instead.
	 *
	 * Returns: the newly allocated #PangoContext,
	 *     which should be freed with g_object_unref().
	 *
	 * Since: 1.22
	 */
	public PgContext createContext()
	{
		auto p = pango_font_map_create_context(pangoFontMap);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgContext)(cast(PangoContext*) p, true);
	}

	/**
	 * Returns the current serial number of @fontmap.  The serial number is
	 * initialized to an small number larger than zero when a new fontmap
	 * is created and is increased whenever the fontmap is changed. It may
	 * wrap, but will never have the value 0. Since it can wrap, never compare
	 * it with "less than", always use "not equals".
	 *
	 * The fontmap can only be changed using backend-specific API, like changing
	 * fontmap resolution.
	 *
	 * This can be used to automatically detect changes to a #PangoFontMap, like
	 * in #PangoContext.
	 *
	 * Returns: The current serial number of @fontmap.
	 *
	 * Since: 1.32.4
	 */
	public uint getSerial()
	{
		return pango_font_map_get_serial(pangoFontMap);
	}

	/**
	 * Returns the render ID for shape engines for this fontmap.
	 * See the <structfield>render_type</structfield> field of
	 * #PangoEngineInfo.
	 *
	 * Returns: the ID string for shape engines for
	 *     this fontmap. Owned by Pango, should not be modified
	 *     or freed.
	 *
	 * Since: 1.4
	 */
	public string getShapeEngineType()
	{
		return Str.toString(pango_font_map_get_shape_engine_type(pangoFontMap));
	}

	/**
	 * List all families for a fontmap.
	 *
	 * Params:
	 *     families = location to store a pointer to an array of #PangoFontFamily *.
	 *         This array should be freed with g_free().
	 */
	public void listFamilies(out PgFontFamily[] families)
	{
		PangoFontFamily** outfamilies = null;
		int nFamilies;

		pango_font_map_list_families(pangoFontMap, &outfamilies, &nFamilies);

		families = new PgFontFamily[nFamilies];
		for(size_t i = 0; i < nFamilies; i++)
		{
			families[i] = ObjectG.getDObject!(PgFontFamily)(cast(PangoFontFamily*) outfamilies[i]);
		}
	}

	/**
	 * Load the font in the fontmap that is the closest match for @desc.
	 *
	 * Params:
	 *     context = the #PangoContext the font will be used with
	 *     desc = a #PangoFontDescription describing the font to load
	 *
	 * Returns: the newly allocated #PangoFont
	 *     loaded, or %NULL if no font matched.
	 */
	public PgFont loadFont(PgContext context, PgFontDescription desc)
	{
		auto p = pango_font_map_load_font(pangoFontMap, (context is null) ? null : context.getPgContextStruct(), (desc is null) ? null : desc.getPgFontDescriptionStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFont)(cast(PangoFont*) p, true);
	}

	/**
	 * Load a set of fonts in the fontmap that can be used to render
	 * a font matching @desc.
	 *
	 * Params:
	 *     context = the #PangoContext the font will be used with
	 *     desc = a #PangoFontDescription describing the font to load
	 *     language = a #PangoLanguage the fonts will be used for
	 *
	 * Returns: the newly allocated
	 *     #PangoFontset loaded, or %NULL if no font matched.
	 */
	public PgFontset loadFontset(PgContext context, PgFontDescription desc, PgLanguage language)
	{
		auto p = pango_font_map_load_fontset(pangoFontMap, (context is null) ? null : context.getPgContextStruct(), (desc is null) ? null : desc.getPgFontDescriptionStruct(), (language is null) ? null : language.getPgLanguageStruct());

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFontset)(cast(PangoFontset*) p, true);
	}
}
