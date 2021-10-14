Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mb2mX-0008T0-F3
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 11:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mb2mS-0008QR-V3
 for qemu-riscv@nongnu.org; Thu, 14 Oct 2021 11:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mb2mL-0007Jk-T6
 for qemu-riscv@nongnu.org; Thu, 14 Oct 2021 11:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1adBIZGKXSU5y4M0TDRr3IIogDLxARLXmixeprWkpps=;
 b=OunTeFy8BtfNsZmAMXTdBPxmYr6jQ74dFz9+aNA/KqjMsnmt/XpQkWC40jLPm3vBwzmBSz
 A0qjnVKzefZqdNX1Bu29r9j4Z5RuTtePwRsSd6ulZUYv09m9LPCnHqwcQYshKo4zZOY3dk
 dVsKW44ApphwPuFxeE97TyOwKbgMeRA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-aNY-UpjjO3KUD3gP1e_o0g-1; Thu, 14 Oct 2021 11:36:18 -0400
X-MC-Unique: aNY-UpjjO3KUD3gP1e_o0g-1
Received: by mail-wr1-f69.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so4840160wrk.12
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 08:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1adBIZGKXSU5y4M0TDRr3IIogDLxARLXmixeprWkpps=;
 b=S9k0wU8wNomxWEYfHLJZP8hlLAoQULg61m0rLNMfgx0RAKNBBECRrQDyQRV1J/V0gE
 REcZDP0iYnkH4C2oxUuWhUVOHghVL7SuxrW5rvuzlPRVw7ptw5EcaN5Hcsal6myB6cMa
 FPlutZjNbB6yRsa7wwmqpjNnBqN0EGCeaDIp23qT6PtZyhunRyPr9CWPlKdGSk6nmE4N
 f42DyuiR+AfrenP75aOVsRDiO3Vb3NwsEW8N8TcRVxiDN5lIuu/mFkOnbVSr1gZSTC6O
 dJirCQGLEWHs8/Se3625ZaWn/tsYJfd9JUHJN85sIydMwOHMqCO146RdUhdXEIFUm8jb
 THPw==
X-Gm-Message-State: AOAM533o1F/MKOOwaGhtJb/EENL99TkFdS3Mw9+LyGDTf2gfFr6WhSHT
 YojB6ditlxhmn9jN8L9HyIObWr2xLIbHLL/YOP2YxeGUsmiQbUXO7Hk2C4ilv7oOxMcQVkTIuMY
 0qqxd6yWRh3GIf+Y=
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr19973157wmc.69.1634225776882; 
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKUP0PGy0DaQKlto0DL+/2Jx2SX95M3cisgkjjCWjbbdvQE+XJU5IdJDtZeV167uCzkbrjsQ==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr19973122wmc.69.1634225776578; 
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id k17sm2573270wrc.93.2021.10.14.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:36:16 -0700 (PDT)
Date: Thu, 14 Oct 2021 17:36:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211014153609.pzndx7um3dfdgelo@gator>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211014171417.541c9bee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Oct 2021 15:36:31 -0000

On Thu, Oct 14, 2021 at 05:14:17PM +0200, Igor Mammedov wrote:
> On Wed, 13 Oct 2021 14:28:40 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Wed, Oct 13, 2021 at 02:11:25PM +0200, Andrew Jones wrote:
> > > On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:  
> > > > On Wed, 13 Oct 2021 13:35:44 +0200
> > > > Andrew Jones <drjones@redhat.com> wrote:
> > > >   
> > > > > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:  
> > > > > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > > > > Gavin Shan <gshan@redhat.com> wrote:
> > > > > >     
> > > > > > > The following option is used to specify the distance map. It's
> > > > > > > possible the option isn't provided by user. In this case, the
> > > > > > > distance map isn't populated and exposed to platform. On the
> > > > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > > > > but their NUMA IDs should be included in the "/distance-map"
> > > > > > > device-tree node, so that kernel can probe them properly if
> > > > > > > device-tree is used.
> > > > > > > 
> > > > > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > > > 
> > > > > > > This adds extra check after the machine is initialized, to
> > > > > > > ask for the distance map from user when empty nodes exist in
> > > > > > > device-tree.
> > > > > > > 
> > > > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > > > ---
> > > > > > >  hw/core/machine.c     |  4 ++++
> > > > > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > > > > >  include/sysemu/numa.h |  1 +
> > > > > > >  3 files changed, 29 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > > > > index b8d95eec32..c0765ad973 100644
> > > > > > > --- a/hw/core/machine.c
> > > > > > > +++ b/hw/core/machine.c
> > > > > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > > > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > > > > >      machine_class->init(machine);
> > > > > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > > > > +
> > > > > > > +    if (machine->numa_state) {
> > > > > > > +        numa_complete_validation(machine);
> > > > > > > +    }
> > > > > > >  }
> > > > > > >  
> > > > > > >  static NotifierList machine_init_done_notifiers =
> > > > > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > > > > index 510d096a88..7404b7dd38 100644
> > > > > > > --- a/hw/core/numa.c
> > > > > > > +++ b/hw/core/numa.c
> > > > > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > > > > >      }
> > > > > > >  }
> > > > > > >  
> > > > > > > +/*
> > > > > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > > > > + * be included in the distance map. So we need provide pairs of distances
> > > > > > > + * in this case.
> > > > > > > + */
> > > > > > > +void numa_complete_validation(MachineState *ms)
> > > > > > > +{
> > > > > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > > > > +    int i;
> > > > > > > +
> > > > > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {    
> > > > > > 
> > > > > > also skip check/limitation when VM is launched with ACPI enabled?    
> > 
> > On second thought, I guess it's a good idea to not error out when ACPI is
> > enabled. There's no point in burdening the ACPI user.
> > 
> > > > > 
> > > > > Even with ACPI enabled we generate a DT and would like that DT to be as
> > > > > complete as possible. Of course we should generate a SLIT table with  
> > > > 
> > > > Guest will work just fine without distance map as SRAT describes
> > > > all numa nodes.
> > > > You are forcing VM to have SLIT just for the sake of 'completeness'
> > > > that's practically unused.
> > > > 
> > > > I'm still unsure about pushing all of this in generic numa code,
> > > > as this will be used only by ARM for now. It's better to keep it
> > > > ARM specific, and when RISCV machine will start using this, it
> > > > could be moved to generic code.  
> > 
> > I think RISCV could start using it now. Linux shares the mem/numa DT
> > parsing code between Arm and RISCV. If RISCV QEMU wanted to start
> > exposing NUMA nodes, then they might as well support empty ones from
> > the start.
> 
> When RISCV will start using memory-less nodes, we can move this check to
> generic code.
> So far 2/2 takes care of ARM only, as result I don't see
> a good reason to generalize it now. (CCing RISCV folks to see if
> there is any plans to impl. that)
>  
> 
> > > I don't see a problem in providing this DT node / ACPI table to guests
> > > with empty NUMA nodes. I don't even see a problem with providing the
> > > distance information unconditionally. Can you explain why we should
> > > prefer not to provide optional HW descriptions?  
> > 
> > I'm still curious why we should be so reluctant to add HW descriptions.
> > I agree we should be reluctant to error out, though.
> 
> If distance map were the only way to figure out present node-ids,
> I wouldn't mind making it non-optional.
> 
> However guest can already get node-ids from mem/cpu/pci nodes
> with current device-tree that QEMU generates and
> forcing optional distance-map (with duplicate info) on user
> creates non must-have CLI requirements/inconvenience that
> will eventually propagate to higher layers, I'd rather avoid
> that if possible.
> 
> So question is if an idea of fetching numa-ids from cpu nodes
> in addition to memory nodes (which should cover QEMU needs)
> have been considered and why it didn't work out?

Thinking about it some more. I think we only need patch 2/2 of this
series. We should double check, but if when Linux generates its
default distance-map it already generates a map using the numa-ids
in the cpu nodes of the DT, then I guess the resulting Linux generated
distance-map will be sufficient to represent the empty NUMA nodes and
could be used for DT memory hotplug if Linux ever tried to implement
that.

Gavin, can you check if we can just drop patch 1/2 and then when
booting a DT guest with empty numa nodes we get the distance
map we wanted to enforce anyway?

Thanks,
drew

> 
> > So, when ACPI is
> > enabled, let's skip the enforcement of the SLIT table generation, even
> > if there are empty nodes, as you suggest.
> > 
> > Thanks,
> > drew
> > 
> > > 
> > > Thanks,
> > > drew 
> > >   
> > > >   
> > > > > the distance information the user provides on the command line in order
> > > > > to satisfy the check, and we will, since we already have that code in
> > > > > place.  
> > > > 
> > > >   
> > > > > 
> > > > > Thanks,
> > > > > drew
> > > > >   
> > > > > >     
> > > > > > > +        return;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > > > > +            error_report("Empty node %d found, please provide "
> > > > > > > +                         "distance map.", i);
> > > > > > > +            exit(EXIT_FAILURE);
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +}
> > > > > > > +
> > > > > > >  void parse_numa_opts(MachineState *ms)
> > > > > > >  {
> > > > > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > > > > index 4173ef2afa..80f25ab830 100644
> > > > > > > --- a/include/sysemu/numa.h
> > > > > > > +++ b/include/sysemu/numa.h
> > > > > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > > > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > > > > >                             Error **errp);
> > > > > > >  void numa_complete_configuration(MachineState *ms);
> > > > > > > +void numa_complete_validation(MachineState *ms);
> > > > > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > > > > >  extern QemuOptsList qemu_numa_opts;
> > > > > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,    
> > > > > >     
> > > > >   
> > > >   
> > 
> > 
> 


