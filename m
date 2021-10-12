Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQ4x-0005pR-C4
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 18:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQ4v-0005oa-C9; Tue, 12 Oct 2021 18:16:57 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQ4t-0004eX-Eh; Tue, 12 Oct 2021 18:16:57 -0400
Received: by mail-il1-x12a.google.com with SMTP id i11so583186ila.12;
 Tue, 12 Oct 2021 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8u6sewFGmQKbqoBjnukgKcLj682SKmRME9UMPO/81M=;
 b=VYSVkTvcP+E9CsRNrYmxxDr6MLfsQD8gETS5VVB5I4OIVU9CGooSRhXF/x4hDtcJiT
 lqSjsig6RDb9tL/+pSskI46HDTv1zNoxjQcMm/ze1Gti7BuPM3Tn5/mgKpcaFpPtd9yL
 J43uJJT05sT1IO3xz/cSeRsieDSTPY6VyOWLwTZlu5Ad1IFDExzvLB4tNAP+AXLl9g4R
 SmBrj7XVWU/R1tmMhOLbsc56mrobQOix5Ff2c7Ny/N3WJ15WEO4CKtgwd7P4IfVdmyDa
 Kuo1zFwgXZI99kp/EumCKHY0gOx8jnC5WwapPlZXrNxgRLFsoeEZlETAFFAYZbL8nDqF
 H7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8u6sewFGmQKbqoBjnukgKcLj682SKmRME9UMPO/81M=;
 b=EKomHSLgEjg/eGdOjCT6aexEO13t4DWkaST01AQ+WD0b0piIT3RcjuE50QhXhvArOX
 XNcp2n+UhjJQfzVyBSERqblvmNBr/j5br2SYZlA/qo90AY6bz51OvGCCwwejWL62W1BM
 iEhIGZIO9XHAv4en80DqDxSee4GZgiIlaVPjNyaDtlYgsaF2m8123u64sFNQ0zDcYIYu
 f/jlde22wkF3/PUzP2BI919W4ivnJO5tld2xIhtb+G9wfdu0pF6GxZ4HZHcX63oF6Yr0
 Iqt3xUqKN4+t2WYVD+TvMKmlk609LEZkWJJuqyYK76bKkjYgsyITyJHOV9NmPAfs14h5
 3GaQ==
X-Gm-Message-State: AOAM532NTXlxgirxl5b5MI2LGvcpYBBIJrQj4EnUJdlv2WXoo9+p/lxV
 4OouBpOAUEvQ5YE6mdxx/Mqxh6Wj2BoaNCONdA4=
X-Google-Smtp-Source: ABdhPJz+pKBr8sJq+4PBGCrNMJ/2fChUgJjSegxseimlZl17yEiWjK8esp2u2bbu1fEv9gzbOOLOx0dCej2kJJyrcNo=
X-Received: by 2002:a05:6e02:1885:: with SMTP id
 o5mr4525636ilu.221.1634077013816; 
 Tue, 12 Oct 2021 15:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:16:27 +1000
Message-ID: <CAKmqyKMUvtRPCp=FJMHcMdsECfJ_fRHBi4dA2N3gtqmPHspNJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Oct 2021 22:16:57 -0000

On Thu, Sep 23, 2021 at 2:22 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> The goal of this work is to bring dynamic machine creation to QEMU:
> we want to setup a machine without compiling a specific machine C
> code. It would ease supporting highly configurable platforms (for
> example resulting from an automated design flow). The requirements
> for such configuration include begin able to specify the number of
> cores, available peripherals, emmory mapping, IRQ mapping, etc.
>
> This series focuses on the first step: populating a machine with
> devices during its creation. We propose patches to support this
> using QMP commands. This is a working set of patches and improves
> over the earlier rfc (posted in May):
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
>
> Although it is working and could be merged, it is tag as an RFC:
> we probably need to discuss the conditions for allowing a device to
> be created at an early stage. Patches 6, 10 and 13, 15 and 16 depend
> on such conditions and are subject to change. Other patches are
> unrelated to this point.
>
> We address several issues in this series. They are detailed below.
>
> ## 1. Stoping QEMU to populate the machine with devices
>
> QEMU goes through several steps (called _machine phases_) when
> creating the machine: 'no-machine', 'machine-created',
> 'accel-created', 'initialized', and finally 'ready'. At 'ready'
> phase, QEMU is ready to start (see Paolo's page
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence for
> more details).
>
> Using the -preconfig CLI option, QEMU can be stopped today during
> the 'accel-created' phase. Then the 'x-exit-preconfig' QMP command
> triggers QEMU moving forwards to the completion of the machine
> creation ('ready' phase).
>
> The devices are created during the 'initialized' phase.
> In this phase the machine init() method has been executed and thus
> machine properties have been handled. Although the sysbus exists and
> the machine may have been populated by the init(),
> _machine_init_done_ notifiers have not been called yet. At this point
> we can add more devices to a machine.
>
> We propose to add 2 QMP commands:
> + The 'query-machine-phase' command would return the current machine
>   phase.
> + The 'x-machine-init' command would advance the machine phase to
>   'initialized'. 'x-exit-preconfig' could then still be used to
>   advance to the last phase.
>
> ## 2. Adding devices
>
> Right now, the user can create devices in 2 ways: using '-device' CLI
> option or 'device_add' QMP command. Both are executed after the
> machine is ready: such devices are hot-plugged. We propose to allow
> 'device_add' QMP command to be used during the 'initialized' phase.
>
> In this series, we keep the constraint that the device must be
> 'user-creatable' (this is a device class flag). We do not see any
> reason why a device the user can hot-plug could not be created at an
> earlier stage.
>
> This part is still RFC because, as Peter mentioned it (in this thread
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01933.html),
> we may want additional or distinct conditions for:
> + device we can hot-plug
> + device we can add in '-preconfig' (cold-plug)
> We are open to suggestions. We could for example add a
> 'preconfig-creatable' or 'init-creatable' flag to device class, which
> can identify a set of devices we can create this way.
>
> The main addition is how we handle the case of sysbus devices. Sysbus
> devices are particular because unlike, for example, pci devices, you
> have to manually handle the memory mapping and interrupts wiring. So
> right now, a sysbus device is dynamically creatable (using -device
> CLI option or device_add QMP command) only if:
> + it is 'user_creatable' (like any other device),
> + and it is in the current machine sysbus device allow list.
>
> In this series, we propose to relax the second constraint during the
> earlier phases of machine creation so that when using -preconfig we
> can create any 'user-creatable' sysbus device. When the machine
> progresses to the 'ready' phase, sysbus devices creation will come
> back to the legacy behavior: it will be possible only based on the
> per-machine authorization basis.
>
> For sysbus devices, wiring interrupts is not a problem as we can use
> the 'qom-set' QMP command, but memory mapping is.
>
> ## 3. Memory mapping
>
> There is no point allowing the creation sysbus devices if we cannot
> map them onto the memory bus (the 'sysbus').
>
> As far as we know, right now, there is no way to add memory mapping
> for sysbus device using QMP commands. We propose a 'x-sysbus-mmio-map'
> command to do this. This command would only be allowed during the
> 'initialized' phase when using -preconfig.
>
> ## 4. Working example
>
> The last patches of the series add and modify devices in order to
> build a working machine starting from the 'none' machine.
>
> We add a new sysbus device modeling a simple memory (ram or rom). We
> also set 'user-creatable' flag of some sysbus devices. These are
> trivial patches, but they depends on the conditions we choose to allow
> creating devices with -preconfig. Therefore, there is really no need
> to review them until we settled on the device conditions first.
>
> With these devices (memory, ibex_uart, ibex_plic) we can dynamically
> configure a part (we did not add the timer, but we could) the
> opentitan machine very easily and run firmwares which demonstrates
> interrupts and memory-mapping are working.
>
> We use the existing qmp-shell script to issue machine devices
> from a qmp commands script file which contains qmp commands listed in
> a file.
>
> The following qmp commands add some memories, an interrupt controller
> and an uart with an interrupt.
>
> cat > opentitan.qmp <<EOF
> x-machine-init
>
> # ROM 0x00008000
> device_add        driver=sysbus-memory id=rom size=0x4000 readonly=true
> x-sysbus-mmio-map device=rom addr=32768
>
> # FLASH 0x20000000
> device_add        driver=sysbus-memory id=flash size=0x80000 readonly=true
> x-sysbus-mmio-map device=flash addr=536870912
>
> # RAM 0x10000000
> device_add        driver=sysbus-memory id=ram size=0x10000
> x-sysbus-mmio-map device=ram addr=268435456
>
> # PLIC 0x41010000
> device_add        driver=ibex-plic id=plic
> x-sysbus-mmio-map device=plic addr=1090584576
>
> # UART 0x40000000
> device_add        driver=ibex-uart id=uart chardev=serial0
> x-sysbus-mmio-map device=uart addr=1073741824
> qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
>
> x-exit-preconfig
> EOF
>
> We've put the opentitan.qmp and a firmware opentitan-echo.elf here
> (among some other qmp machine files we are working on):
> https://github.com/GreenSocs/qemu-qmp-machines

I am unable to access this repo, maybe it's not public?

Alistair

