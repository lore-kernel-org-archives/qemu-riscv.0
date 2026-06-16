Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9886BCD98D2
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 23:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdbK-0008RW-Ja; Tue, 16 Jun 2026 19:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZdbI-0008R1-EM
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:53:48 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wZdbG-0006fl-1Z
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:53:48 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6611689dc10so5304677d50.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781654025; cv=none;
 d=google.com; s=arc-20240605;
 b=HJVnJEawMxUpUBhyaNCnzzFJsTlXnfBit30WmMZk+pmGlteMCmMw5VvlNTqkX70gzf
 sSoR7riFutdZObQPPckg1c8vQYwIu0T5GfuvjlrKlrpMIu+nzKWXmwenWum5q+x35vhl
 kDsY/KTrdecBvqF7RNflTboru80yytX3PIsWJosOLqHekbXwyXDw4z8xGneIG8vOQiaI
 z4QolJboy0BqjRoasWpfBTihedU5libdrJRuAF527pbUWr/vqEhe2Fg7kE3F4nnxhLZY
 tKTt4Iq8MUpnuy5045hwj78/8/aiAf4dp7SvLPkNDF3UH7DYOLVdYEV1X1d3mE55vpwj
 bQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3uyaD0H+P51kA/CNyr779LEJ13leNm6JvFsygQeaYEE=;
 fh=74WaDkWqF7YrHSkfRvYFASqJMVJe3MUFI7rZNyZkfek=;
 b=hTOu4hFJOfFBPVMRMwDpO8/h5Zs9flCn6qiy4FkO6UOa2jRPVYsQzynOXbLtcZcRUx
 QhBW9e5GsUatnD2E2CW+C6MH9hikNt1L16l0RZYECfCrOuPyA8oeLcwL5zufRUaQLeNu
 Y06BZN4bHFegFOGZtHiFsrEwkP61ynZcsY9fKzd+TP/GeNZ0s3EsuF78ykiZLhmnwlA4
 I+NZ/0KIKxGP7LE7bBAsrz+J8VFUJjfT8LkC8+Pb8fd31IFhcuMIR48+qGI1176JQukR
 EftOBGGfZlxzFjQ2WsvwkWaAcazz4jJMGmhlNTtwPO5Yzm5EA+wzZAE91h1Hh1U8thSc
 qOOA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1781654025; x=1782258825; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uyaD0H+P51kA/CNyr779LEJ13leNm6JvFsygQeaYEE=;
 b=ctkNPnaQpQzgh+2viHAxkCylTCuGYtDgl2XuDa/6NY+KG2qezNV7EMkxjCLbR24xFA
 xCxcd/sMwMSsX/TabFKCTHn4qzIAiHbor0AEVVjCgkPanFv8TTiCLRbBo10TGjlY4o2v
 KhRsQr25dCAk3iGMp/xs5VGU2+tf9c50uMKcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654025; x=1782258825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3uyaD0H+P51kA/CNyr779LEJ13leNm6JvFsygQeaYEE=;
 b=oGIfaneXEvvT0H/oSwr12iXtMIsT4zZ31yfcYFJmAyC/R3trwAd8Kf8lmGITzSu0+t
 LT7dHpOMAwoCTuRyoPFC3OvihgtJBLH4LLOm0hWPsVXxYSL79sRCqd8P0IvYTi3xLvXx
 VsSCLYacHqY+xxS697mpxaH4Y16LgNHCPEun9Mu6RUqY4Rkf9W/8fcZ6E2GpOtVwzp9V
 0muAbYbrw8s8bS9wg0M/W5EoIVO/+nxPd60ijqGfArvj9MPLmZGslvNmbwPqcdRi2Lof
 arZxRkoyjGagbLgkQn05nrDS2+ATmTic7jR5CwhdcDUr7VkzdHAuQ7xt6A+cT+3tcP8w
 vy3A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9GUKALiAizTDmY9LG/xA9pmIyl0VcPY+5bJZeTl85gZ/2ziYDJQm14WMVAGmzagDU4UWnbcnACgXE+@nongnu.org
X-Gm-Message-State: AOJu0YzzpwUPzPEbQi7h0oDbDY7ywBrnjKnMkUEuF9iXyM78ZdNPweyj
 Zfyte7Hhr569iejFXIrqpWwA+udXxhO3vwCyPoFi/Ge/AbBiL4M8ODsbes3kgplwJZ69SHiK5kM
 T5qgA5hNEgBeEWpJpMJDd8dm2O3BHfc0=
X-Gm-Gg: AfdE7ckWIHqIfoGYNZkB/A7eeo36VIoYtYFxhWA6BfMbNvI2ZtqFQYaZzFLad8j+qRi
 R0AnnV0np2nzo6CkHB12uI+ZMaDaTJ9g/WoFfqfkc9w2m5CSRWcGX68yVImp/WgE+KhsauVKxQq
 op5ZXwhuEW/h6200XeYRbUSPbORjd8Galt5drj4KkW5zmfN3lFa6adGxtgNxe9EXoyvreevAI9c
 Cu+0wzJc5/gMyib38rw6tl5VklP8YntaOV3gDX2EhrHxhxqypDg2NncPz4Qsrv+nVr6mNPQ9jwA
 e3IMkVVuF+/VvzdC3Owv5ZvWRXrxcZgGIiuMw1+x1uyCSZuD/jkMBwUURztK697r975hsbRZngG
 hUdLFs5oC2XuBWOwj/C/wDEK3
X-Received: by 2002:a53:c0cf:0:b0:65e:4ac9:272e with SMTP id
 956f58d0204a3-662cbd1f291mr977534d50.50.1781654024771; Tue, 16 Jun 2026
 16:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-8-joel@jms.id.au>
 <CAKmqyKP0VxQj0apsuVOrCeaP0KVHy5VfdqH-Nn9_99Vc76Ru_w@mail.gmail.com>
In-Reply-To: <CAKmqyKP0VxQj0apsuVOrCeaP0KVHy5VfdqH-Nn9_99Vc76Ru_w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Jun 2026 09:23:33 +0930
X-Gm-Features: AVVi8CcFJ3G0RX6JPO1K2-FuV6xVNUm69iRE_OsHDmYuZfclUjLd1CAoD8fziiA
Message-ID: <CACPK8Xdow4U7qJ73BFneyzxo6U1RK1kLnY=UkdQzskY7H=oqOQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/12] hw/riscv: Add Tenstorrent Atlantis machine
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 15 Jun 2026 at 15:15, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Wed, Jun 3, 2026 at 5:04=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrot=
e:

> > +static void load_fdt(TTAtlantisState *s)
> > +{
> > +    MachineState *ms =3D MACHINE(s);
> > +    char **node_path;
> > +    Error *err =3D NULL;
> > +
> > +    ms->fdt =3D load_device_tree(ms->dtb, &s->fdt_size);
> > +    if (!ms->fdt) {
> > +        error_report("load_device_tree() failed");
> > +        exit(1);
> > +    }
> > +
> > +    qemu_fdt_add_path(ms->fdt, "/chosen");
> > +
> > +    /* Clear memory nodes and update with the specified RAM size */
> > +    node_path =3D qemu_fdt_node_unit_path(ms->fdt, "memory", &err);
> > +    if (err) {
> > +        warn_report_err(err);
> > +    } else {
> > +        for (int i =3D 0; node_path[i]; i++) {
> > +            qemu_fdt_nop_node(ms->fdt, node_path[i]);
>
> Should we print a warning here to the user that we are doing this? I
> would be confused (and annoyed) if QEMU deleted my memory regions and
> I didn't know

The code is the same for the arm machines; they silently update the
device tree when provided one. I agree with you though, I will add a
warning.

I added this as in testing the device tree was larger than what the
machine had, which Linux happily tries to use and crashes during boot.
I can see the argument for not touching the device tree at all but on
balance I decided helping the user out is the right thing to do. If
users complain I'm happy to change it.

> > +static void tt_atlantis_machine_done(Notifier *notifier, void *data)
> > +{
> > +    TTAtlantisState *s =3D container_of(notifier, TTAtlantisState, mac=
hine_done);
> > +    MachineState *machine =3D MACHINE(s);
> > +    hwaddr start_addr =3D s->memmap[TT_ATL_DDR_LO].base;
> > +    hwaddr mem_size;
> > +    target_ulong firmware_end_addr, kernel_start_addr;
> > +    const char *firmware_name =3D riscv_default_firmware_name(&s->soc)=
;
> > +    uint64_t fdt_load_addr;
> > +    uint64_t kernel_entry;
> > +    RISCVBootInfo boot_info;
> > +
> > +    /*
> > +     * A user provided dtb must include everything, including
> > +     * dynamic sysbus devices. Our FDT needs to be finalized.
> > +     */
> > +    if (machine->dtb =3D=3D NULL) {
> > +        finalize_fdt(s);
>
> Was expecting a finalise here :)

Desensitized.

> > +    /* DDR */
> > +
> > +    /* The high address covers all of RAM, the low address just the fi=
rst 2GB */
> > +    lo_ram_size =3D s->memmap[TT_ATL_DDR_LO].size;
> > +    hi_ram_size =3D s->memmap[TT_ATL_DDR_HI].size;
> > +    if (machine->ram_size > hi_ram_size) {
>
> What if machine->ram_size is less then s->memmap[TT_ATL_DDR_HI].size?
> You will still allocate s->memmap[TT_ATL_DDR_HI].size instead of what
> the user asked for. You then report what the user asked for in the DT,
> so there is a bunch of wasted memory.
>
> Memory is expensive these days, we can't waste it
>
> Also, if the user asks for 2GB or less, you shouldn't create ram.high at =
all

Good catch. There's an even better bug; ram.high and ram.low are
aliases into the machine ram region and they are always sized to their
default maximum, regardless of the machine ram size.

address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, container): system
    0000000000000000-000000007fffffff (prio 0, ram): alias ram.low
@tt_atlantis.ram 0000000000000000-000000007fffffff
    0000000100000000-00000010ffffffff (prio 0, ram): alias ram.high
@tt_atlantis.ram 0000000000000000-0000000fffffffff
memory-region: tt_atlantis.ram
  0000000000000000-00000000ffffffff (prio 0, ram): tt_atlantis.ram

They should be sized to the configured size.

The device tree is okay because it sets the region based on the
configured ram size, and Linux politely doesn't write outside of that.

In hardware the high region is where the ram lives and low is an alias
of the first 2GB. I'll fix up the modelling to match, and set the
sizes appropriately.

> Otherwise looks good

Thanks for the review.

Cheers,

Joel

