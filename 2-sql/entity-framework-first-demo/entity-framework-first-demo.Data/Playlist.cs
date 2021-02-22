using System;
using System.Collections.Generic;

#nullable disable

namespace entity_framework_first_demo.Data
{
    public partial class Playlist
    {
        public Playlist()
        {
            PlaylistTracks = new HashSet<PlaylistTrack>();
        }

        public int PlaylistId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<PlaylistTrack> PlaylistTracks { get; set; }
    }
}
