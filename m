Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozwuP-0003Cy-0S
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 04:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozwuM-0003Cb-Ca
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 04:28:06 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozwuJ-0003Pp-FK
 for qemu-riscv@nongnu.org; Tue, 29 Nov 2022 04:28:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id j12so12828312plj.5
 for <qemu-riscv@nongnu.org>; Tue, 29 Nov 2022 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6YxKCWjmBcRyuqFUiN78zpumF5ARys9MWW1Q6cRd58=;
 b=TlVhtHj7TdtsvU9BDlXQuOr8RxElehNZXHHW5Aa/Q5cmIpK8BmFTK2rHdOxRmj+Mow
 EsTUmU6PqiAS78ow7bJnwRetwLq55c1+CtJFlt+qeap1dA8defRjTzP3NIA7sRtz5Pei
 x6wq1yGPEKJsB4T3bntfM4pz05l6oHX0RB3DIWkYNDmiyeBehnvjbwwl1G4w7gzjVda+
 R8cc3Xy2j/+2J8WKLohIOaPyC9RCBehNjUsnl/noUUqzFn7a0qRh4q0QsWsBoYwDHq4a
 smZU1vu59giv6CHa8jIQ/R/fgMw+GjhJ1NemVk17rry4D63eI5CBZjsfd1ef38ujgOCp
 EgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6YxKCWjmBcRyuqFUiN78zpumF5ARys9MWW1Q6cRd58=;
 b=7Lw7voupcPo60jwuAhCZzwiTl6fG7toViGnGnbMQb+uxbZ/lagMjcuL7S4Uteln9CL
 AAS7Sfc7j7qOveJJMAhbpVJYrsE2ulCVIGuSYyZu37sRF2or9YVpVczljxvpeiyhf7tx
 1KDjmgueiwhR+2bcUttvXTZgv7b20CHlsdPrAsOeTMJX9xu0TxpSlIyqiguMj8xF/sbx
 OvilOYdQMprdhprmSxIodSc2zaMlR3TKE1Q2OR2XuaKd+SQJIsR8PVEbtuEHmZYmiDYV
 GtUgnw1iSY7f0l+CrJXarkeo4gTF9njNQxFxbe5dVR5AOokLYUECAubUQvqwIyJzqb7l
 5cqQ==
X-Gm-Message-State: ANoB5pnChaXjgAV5EUdrVrEabOpOrHkx4i3OvrAPVRbmSGXSHt/P6fXj
 7aZO6PoL+ogKNX6K3OpGrHbQW1U+ySXQeB36lIHVuQ==
X-Google-Smtp-Source: AA0mqf6FZb1lXjlNkFXwOXj3BaCWeNjad5vEVoBSJ6usVK94VNDrSTpy7pNQhDMmdTdQk/qNAXpl9sXlqGQgHd+zfaQ=
X-Received: by 2002:a17:902:ef47:b0:186:a394:aef7 with SMTP id
 e7-20020a170902ef4700b00186a394aef7mr50284312plx.79.1669714081514; Tue, 29
 Nov 2022 01:28:01 -0800 (PST)
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
In-Reply-To: <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 29 Nov 2022 01:27:49 -0800
Message-ID: <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
To: Conor.Dooley@microchip.com
Cc: ajones@ventanamicro.com, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, qemu-riscv@nongnu.org, 
 samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Nov 2022 09:28:06 -0000

On Mon, Nov 28, 2022 at 11:32 PM <Conor.Dooley@microchip.com> wrote:
>
> On 29/11/2022 07:08, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >
> > On Mon, Nov 28, 2022 at 09:10:03PM +0000, Conor.Dooley@microchip.com wr=
ote:
> >> On 28/11/2022 20:41, Atish Kumar Patra wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> >>>
> >>> On Mon, Nov 28, 2022 at 12:38 PM <Conor.Dooley@microchip.com> wrote:
> >>>>
> >>>> On 28/11/2022 20:16, Atish Kumar Patra wrote:
> >>>>> On Thu, Nov 24, 2022 at 5:17 AM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
> >>>>>>
> >>>>>> On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> >>>>>>> Qemu virt machine can support few cache events and cycle/instret =
counters.
> >>>>>>> It also supports counter overflow for these events.
> >>>>>>>
> >>>>>>> Add a DT node so that OpenSBI/Linux kernel is aware of the virt m=
achine
> >>>>>>> capabilities. There are some dummy nodes added for testing as wel=
l.
> >>>>>>
> >>>>>> Hey Atish!
> >>>>>>
> >>>>>> I was fiddling with dumping the virt machine dtb again today to ch=
eck
> >>>>>> some dt-binding changes I was making for the isa string would play
> >>>>>> nicely with the virt machine & I noticed that this patch has intro=
duced
> >>>>>> a new validation failure:
> >>>>>>
> >>>>>> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dqem=
u.dtb
> >>>>>>
> >>>>>> dt-validate -p ../linux/Documentation/devicetree/bindings/processe=
d-schema.json qemu.dtb
> >>>>>> /home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhpmco=
unters': [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 65563, =
524280, 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu']}=
 should not be valid under {'type': 'object'}
> >>>>>>          From schema: /home/conor/.local/lib/python3.10/site-packa=
ges/dtschema/schemas/simple-bus.yaml
> >>>>>>
> >>>>>> I assume this is the aforementioned "dummy" node & you have no int=
ention
> >>>>>> of creating a binding for this?
> >>>>>>
> >>>>>
> >>>>> It is a dummy node from Linux kernel perspective. OpenSbi use this
> >>>>> node to figure out the hpmcounter mappings.
> >>>>
> >>>> Aye, but should it not have a binding anyway, since they're not
> >>>> meant to be linux specific?
> >>>>
> >>> It is documented in OpenSBI.
> >>> https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_su=
pport.md
> >>>
> >>> Are you suggesting that any non-Linux specific DT nodes should be par=
t
> >>> of Linux DT binding as well ?
> >>
> >> I thought the point was that they were *not* meant to be linux specifi=
c,
> >> just happening to be housed there.
> >>
> >
> > I'm not sure if there's an official policy on where DT nodes should be
> > specified, but it looks like Samuel's opinion is that they should live
> > in the Linux kernel, whether they're used there or not [1].
> >
> > [1] http://lists.infradead.org/pipermail/opensbi/2022-October/003522.ht=
ml
>
> Yah, that was also my understanding. See also U-Boot moving to unify
> their custom bindings into the linux repo:
> https://lore.kernel.org/linux-devicetree/20220930001410.2802843-1-sjg@chr=
omium.org/
>

This adds the U-Boot specific DT properties to the dts schema itself,
not Linux kernel DT bindings.

I am not opposed to adding PMU DT bindings to Linux but there should
be a clear policy on this.
What about OpenSBI domain DT bindings ?
If every other DT based open source project starts adding their DT
binding to the Linux kernel, that may go downhill pretty soon.

>
>
>

