Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0IEF-0005gh-Vq
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 03:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1p0IEE-0005gO-Bx
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 03:14:02 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1p0IEC-0004wY-4p
 for qemu-riscv@nongnu.org; Wed, 30 Nov 2022 03:14:02 -0500
Received: by mail-pl1-x632.google.com with SMTP id 4so15955043pli.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Nov 2022 00:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObWIMj0zNBpxazFlDeJmnclP9pj/oifNF19lASaHxe4=;
 b=NAD89wYUasHvZDPsoW6IK8fqQYUwCNtOX7Oj7mcGqgJQM/lMF9zxohENIPNHNRD3K3
 u9Zn97NbDBa6LZUZGfNx+IuXQsn+OfWiJxzV+/xvbuCJ/pgXc+LpA7BrrE2PLjVGvNCK
 ytSKZS+cJMOM1qqjZI9+VFQ8SLng2kKWsJFWuIlCPPLYrJ53AVBrSgc7HaTL3HVR9AP5
 MEdRg+JrjvFDMkDAHaTw3vCYfUf7B5isr6uwdHpK7QCgQ1aEOgzdKwRdOnXLTnb59dZg
 rcFLkZWZ6cNEqaE/7TAkOSAWnpyDiyDT4DKagsYbbrJ387iRMkdIQCQYhLAPqTS9LVud
 uloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObWIMj0zNBpxazFlDeJmnclP9pj/oifNF19lASaHxe4=;
 b=LDeP89s2vx4xMeA4PyueS2o8FjIDE3Ptft7hFelVHWETTjQCKF7nuI+qbVx0qpg71z
 AZ3JKMFnIPKtBESX2C6k1UqTN998huhBdfTQIUfA15cWnS7V8Yx5ROlSHZ5TujW+ehPT
 /YFY2sv+MBlbXdSl/40YFdHC8ez66185GBRGe2qMNc3MuiREUYyVK9dM8VMkiiMPXX2I
 b5c1iOGBwvCxGKoKygzx8PbopwEooQoezM9aLDfRzUNrqfncmIw8Sfl7EPTV56YITeq7
 2JNOOSbLlIuy9cO0FnYqjnLA0IXIDaXX0WHNvJ16y93CGduzvCfj5YgH/7SrQ6zMM785
 2wvw==
X-Gm-Message-State: ANoB5pmbpiqNXlmXnFf4HT7tnGsmL5zt7RPBrbvcNFa2GRbPtFtO6YVn
 ozXLDoHNf62HTAV7yBNYnGYMeaPUHht2gPaBBD2F6Q==
X-Google-Smtp-Source: AA0mqf4AaAz7UFr4oFz2UuRVaNCerlvvVZTmnDfwMkxjk2En4h8dJcUfTUGO23V68BQOh2lK/kj898J26sMYByEDEEQ=
X-Received: by 2002:a17:902:ef47:b0:186:a394:aef7 with SMTP id
 e7-20020a170902ef4700b00186a394aef7mr55145525plx.79.1669796038305; Wed, 30
 Nov 2022 00:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com>
 <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
 <20221129070820.7varmruxjkhdwoc6@kamzik>
 <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
 <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
 <41abdee4-8d33-193b-9b78-080c75a8fec1@microchip.com>
 <0d83cbe9-bc8c-75da-e1a0-a4eb8b3824fd@microchip.com>
In-Reply-To: <0d83cbe9-bc8c-75da-e1a0-a4eb8b3824fd@microchip.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 30 Nov 2022 00:13:47 -0800
Message-ID: <CAHBxVyGd8CuBBxyWRX4AYS-VZUC+=ae3x5zcxRN9UMKjcaT6KA@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
To: Conor.Dooley@microchip.com
Cc: robh@kernel.org, ajones@ventanamicro.com, qemu-devel@nongnu.org, 
 alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2022 08:14:02 -0000

On Tue, Nov 29, 2022 at 3:54 PM <Conor.Dooley@microchip.com> wrote:
>
> +CC Rob, which I probably should've done earlier, so
> context all preserved
>
> On 29/11/2022 09:42, Conor Dooley wrote:
> > On 29/11/2022 09:27, Atish Kumar Patra wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
> >>
> >> On Mon, Nov 28, 2022 at 11:32 PM <Conor.Dooley@microchip.com> wrote:
> >>>
> >>> On 29/11/2022 07:08, Andrew Jones wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you kn=
ow the content is safe
> >>>>
> >>>> On Mon, Nov 28, 2022 at 09:10:03PM +0000, Conor.Dooley@microchip.com=
 wrote:
> >>>>> On 28/11/2022 20:41, Atish Kumar Patra wrote:
> >>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you =
know the content is safe
> >>>>>>
> >>>>>> On Mon, Nov 28, 2022 at 12:38 PM <Conor.Dooley@microchip.com> wrot=
e:
> >>>>>>>
> >>>>>>> On 28/11/2022 20:16, Atish Kumar Patra wrote:
> >>>>>>>> On Thu, Nov 24, 2022 at 5:17 AM Conor Dooley <conor.dooley@micro=
chip.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> >>>>>>>>>> Qemu virt machine can support few cache events and cycle/instr=
et counters.
> >>>>>>>>>> It also supports counter overflow for these events.
> >>>>>>>>>>
> >>>>>>>>>> Add a DT node so that OpenSBI/Linux kernel is aware of the vir=
t machine
> >>>>>>>>>> capabilities. There are some dummy nodes added for testing as =
well.
> >>>>>>>>>
> >>>>>>>>> Hey Atish!
> >>>>>>>>>
> >>>>>>>>> I was fiddling with dumping the virt machine dtb again today to=
 check
> >>>>>>>>> some dt-binding changes I was making for the isa string would p=
lay
> >>>>>>>>> nicely with the virt machine & I noticed that this patch has in=
troduced
> >>>>>>>>> a new validation failure:
> >>>>>>>>>
> >>>>>>>>> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=3D=
qemu.dtb
> >>>>>>>>>
> >>>>>>>>> dt-validate -p ../linux/Documentation/devicetree/bindings/proce=
ssed-schema.json qemu.dtb
> >>>>>>>>> /home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhp=
mcounters': [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 6556=
3, 524280, 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu=
']} should not be valid under {'type': 'object'}
> >>>>>>>>>           From schema: /home/conor/.local/lib/python3.10/site-p=
ackages/dtschema/schemas/simple-bus.yaml
> >>>>>>>>>
> >>>>>>>>> I assume this is the aforementioned "dummy" node & you have no =
intention
> >>>>>>>>> of creating a binding for this?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> It is a dummy node from Linux kernel perspective. OpenSbi use th=
is
> >>>>>>>> node to figure out the hpmcounter mappings.
> >>>>>>>
> >>>>>>> Aye, but should it not have a binding anyway, since they're not
> >>>>>>> meant to be linux specific?
> >>>>>>>
> >>>>>> It is documented in OpenSBI.
> >>>>>> https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu=
_support.md
> >>>>>>
> >>>>>> Are you suggesting that any non-Linux specific DT nodes should be =
part
> >>>>>> of Linux DT binding as well ?
> >>>>>
> >>>>> I thought the point was that they were *not* meant to be linux spec=
ific,
> >>>>> just happening to be housed there.
> >>>>>
> >>>>
> >>>> I'm not sure if there's an official policy on where DT nodes should =
be
> >>>> specified, but it looks like Samuel's opinion is that they should li=
ve
> >>>> in the Linux kernel, whether they're used there or not [1].
> >>>>
> >>>> [1] http://lists.infradead.org/pipermail/opensbi/2022-October/003522=
.html
> >>>
> >>> Yah, that was also my understanding. See also U-Boot moving to unify
> >>> their custom bindings into the linux repo:
> >>> https://lore.kernel.org/linux-devicetree/20220930001410.2802843-1-sjg=
@chromium.org/
> >>>
> >>
> >> This adds the U-Boot specific DT properties to the dts schema itself,
> >> not Linux kernel DT bindings.
> >
> > Yeah, sorry. I muddled things up a little there. My point was that they
> > are trying to get to a stage where dt-validate and those tools work for
> > them too. I'm not sure were I said "linux repo" rather than "dt-schema
> > repo" when I double checked the file paths in the link before pasting i=
t
> > to make sure it was the dt-schema one.. I blame it being early.
> >
> >> I am not opposed to adding PMU DT bindings to Linux but there should
> >> be a clear policy on this.
> >> What about OpenSBI domain DT bindings ?
> >> If every other DT based open source project starts adding their DT
> >> binding to the Linux kernel, that may go downhill pretty soon.
>
> Rob, perhaps you can be a source of clarity here :) My early morning
> muddling didn't help things.
>
>
> > Maybe I am misunderstanding, but I had thought the goal was to get to
> > user-independent bindings. Rob and Krzysztof certainly labour the point
> > that the bindings should not reflect how one operating system's drivers
> > would like to see them & u-boot or FreeBSD using a property is grounds
> > for it not being removed from the bindings in the linux tree.
> >
> > I'll go and actually ask Rob.
>
> I did go & ask Rob, to which he said "I'll apply it even if no driver."
>

In Linux DT binding or dt schema repo ? I am a bit confused now as we
talked about both above :).

> Do you want to whip up a binding, or shall I?
>

