Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC1CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtnR-0007jg-Ok; Sun, 31 May 2026 23:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtnO-0007jF-Dg
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:58:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtnM-0003Nl-F7
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:58:34 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-68c08bfe5afso4786857a12.2
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286310; cv=none;
 d=google.com; s=arc-20240605;
 b=Ic6LmCG28cXoigcmbdS1HWawxr36ZNUfP30DDuhtLOMTCLCS0Jannf4Hr/g/jl8zwF
 uymmbgS2ZZ/s9RCLMxQpQH1teI7PkKa/pE9AXmnxuyKJrYG/zMtDJGdAKkWyvbZl0VXl
 c5CsFqVTXVsaCcTSbFz/40vsorBJukSTzg/Hc+xuK8ZzZoNnaesGb6xo5O+xxUWfxEUC
 MrCsYNxCg+erTG/OMIGRnwisee8C5somr5vljiG/8lqCMwgu2UzvnYsLeNA64AaLrIk4
 JIYfopyNIlKXf1FrOuaG3i9n7W7N8y21qKFz9joNB4zT1KSu4oY4naZMp9ddELmkLxgO
 iHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ql13wLhgmQQN7U1Q54tIvYXPKzQ0CPyTwIdqz9KD18Y=;
 fh=Vvd7CKfr1lbQm6G1Oh489xpFfonwGMYbINCgIVMjxnI=;
 b=SmsU427EX/JUW6QegKwrRyUrNNNsu139ZC5nd/oyM642p9LJr3WmtDlsSMSJxXDOhK
 eBzBev6y+xEE9VlvsMWZmpkPfVx4o8m/+IBr8/JQWPB/qN7ZHlbPuBjRiSC8m0hH494u
 ZcZ1+Qmce5sFto0sJ7gGsGPr6TleUwbHA6lG76x5ejegW/GO8+f6nVrYSp7oIaUIwz3f
 b2Av6iS7oDgY4tV+OIUbVsMJU6Nwb6d1M/S3Gq5jJo9f5Roq1a20OkplFRPhBKisNQb6
 5L+/j5qulbF32iSDT48D5BfTOe8kepOLvEVChAfo4fY2FRqhhKrQ/z/85u8Eg8JqXRe2
 clSg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286310; x=1780891110; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ql13wLhgmQQN7U1Q54tIvYXPKzQ0CPyTwIdqz9KD18Y=;
 b=hDHBHbExBL0M93mluziVepG8UYB/nonuhqmrYTuEhCjDJEXbbbs5uGy5ug3mI+gu5J
 KCBtqA884g2aDmPPOChRSXZY2Upvd/GxOddzfXhguD3jQBENQmbsOqQAIIlNa/38X6eh
 UyQAT0N4wKCTODXLb4NSzYVj+BrCE08et7UY7XuI9f4aK/bowWXLJ1JRC5Xxn9c5Kf7P
 ak16N3xmMnkk5ckOz+nCVXZo5X9vy/tvXYXyPVUewN5VoP/eOT1Q7Uy6oAju7MTO7K3e
 Lse6dY9ioAL2uMmAdt4E18PFKryJJqJNN77cvMURqhiXiXGA+eCD129CIMMOGQv1oFy0
 tZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286310; x=1780891110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ql13wLhgmQQN7U1Q54tIvYXPKzQ0CPyTwIdqz9KD18Y=;
 b=nQ8KktHmdHCtG2K5j3HBpmmcl+/9pL2c0y/GhyJ5mfeloZBRkdNqZgwu4TdPNgFc+3
 TE4wvUytCL+cdwot8aYULZWE/W0kJSUjAHgwAwZcksTpMp/JFVfVODBVDg1VlKbjLUFz
 FZQ9Cv2rvaymvF4vcG/txs5xdzp4+TL6RxfcazeAkSHSZ4lkBa9qZsKx7JEKjVvyNzEz
 vbYaGWmCS7vsGWS5tHfYYeuO6kmF3rdwo04ZeAXUhWv+VNHyRhnpNmOzLYjbYiM4w981
 lmus7nbFfikKODki0wjfpc1+/Owdg1+heAvePJYwzJiIAqntMz/R6bW9uCGml0ThqAyR
 gkqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mC2CbQEIRmJYvS+ho38Nc4vAxZxYJzmLbOUjcJjir/AVhIPDFel/YeH5TwgVbqKpWyTqX2/JtHlIb@nongnu.org
X-Gm-Message-State: AOJu0Yy7OLe3b4uMuqyiLghBGuvG5VMpiigNTyltnhyQZivlGQbo4MWC
 drH3BK+0ouIloyzwXNuRxkwscsvAQ0Nd2VBQQU0k4HNSJ80bEn/Fw02quLJZB6UxlEHJzruLiFi
 8h8WrVm1XHTKBbWdO7Lf5paY6rW7gg08=
X-Gm-Gg: Acq92OFrFJvWD1gVBUqw5rFyjsxHPQtG457Tu544hNqZvNQh/rJXdnrbiGWluaOurjR
 yZDa3agAnRvaLEw8b4J2W+z4UQzlNflYlxsASpkyiT5Yxkq4Q5Gv8TSqpgB9T7BP3hu0loMmYje
 9YW+SjVjzuIjYR+jNeI62XHIDrfync0uRpkpUvnEVcuksFrjmbeOjKOrUAYNeIxJwB0uGMcsHmi
 h0K8wwi/JOKrIIa9mOKVbQfkHR+sJAtQo/ldCmWDODo2s9R0HMxhfZpF/GSzLFX9GyxPpM0loLv
 pmF/KoEd0ktbBHVBdFEeCMoETQTrwxXx6qm2B/HAZwxSAwJz
X-Received: by 2002:a17:907:d13:b0:bd9:a95f:961e with SMTP id
 a640c23a62f3a-beab0dd95c4mr544154966b.3.1780286310328; Sun, 31 May 2026
 20:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-8-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-8-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:58:03 +1000
X-Gm-Features: AVHnY4I6mnhqEpR75R_MMXrvfyvKrTiHeZOGuDve-31ME87jUQEVDIMwtjVy49g
Message-ID: <CAKmqyKMgSJuj7z0hVhQcssqNjTHHRHuReEHp_NU8caAq8_5nNg@mail.gmail.com>
Subject: Re: [PATCH v11 07/12] hw/riscv/boot: Rewrite setup_rom_reset_vec()
 using load/store API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> In order to make the following commits easier to review, do
> not pre-initialize the reset_vec[] array, fill each word one
> by one. Set the start and FDT load addresses using the load/
> store APIs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 53 ++++++++++++++++++++++---------------------------
>  1 file changed, 24 insertions(+), 29 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index ae2f86c7ceb..c6ab1cc8cfb 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -18,6 +18,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/bswap.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> @@ -444,6 +445,9 @@ void riscv_rom_copy_firmware_info(MachineState *machi=
ne,
>                             &address_space_memory);
>  }
>
> +#define CODE_WORDS 6
> +#define DATA_WORDS 4
> +
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
> @@ -451,43 +455,34 @@ void riscv_setup_rom_reset_vec(MachineState *machin=
e, RISCVHartArrayState *harts
>                                 uint64_t fdt_load_addr)
>  {
>      int i;
> -    uint32_t start_addr_hi32 =3D 0x00000000;
> -    uint32_t fdt_load_addr_hi32 =3D 0x00000000;
> +    const bool rv32 =3D riscv_is_32bit(harts);
> +    uint32_t reset_vec[CODE_WORDS + DATA_WORDS];
>
> -    if (!riscv_is_32bit(harts)) {
> -        start_addr_hi32 =3D start_addr >> 32;
> -        fdt_load_addr_hi32 =3D fdt_load_addr >> 32;
> -    }
> -    /* reset vector */
> -    uint32_t reset_vec[10] =3D {
> -        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn)=
 */
> -        0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b)=
 */
> -        0xf1402573,                  /*     csrr   a0, mhartid  */
> -        0,
> -        0,
> -        0x00028067,                  /*     jr     t0 */
> -        start_addr,                  /* start: .dword */
> -        start_addr_hi32,
> -        fdt_load_addr,               /* fdt_laddr: .dword */
> -        fdt_load_addr_hi32,
> -                                     /* fw_dyn: */
> -    };
> -    if (riscv_is_32bit(harts)) {
> -        reset_vec[3] =3D 0x0202a583;   /*     lw     a1, 32(t0) */
> -        reset_vec[4] =3D 0x0182a283;   /*     lw     t0, 24(t0) */
> +    /* .text */
> +    reset_vec[0] =3D 0x00000297;                  /* 1:  auipc  t0, %pcr=
el_hi(fw_dyn) */
> +    reset_vec[1] =3D 0x02828613;                  /*     addi   a2, t0, =
%pcrel_lo(1b) */
> +    if (harts->harts[0].cfg.ext_zicsr) {
> +        reset_vec[2] =3D 0xf1402573;              /*     csrr   a0, mhar=
tid  */
>      } else {
> -        reset_vec[3] =3D 0x0202b583;   /*     ld     a1, 32(t0) */
> -        reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
> -    }
> -
> -    if (!harts->harts[0].cfg.ext_zicsr) {
>          /*
>           * The Zicsr extension has been disabled, so let's ensure we don=
't
>           * run the CSR instruction. Let's fill the address with a non
>           * compressed nop.
>           */
> -        reset_vec[2] =3D 0x00000013;   /*     addi   x0, x0, 0 */
> +        reset_vec[2] =3D 0x00000013;              /*     addi   x0, x0, =
0 */
>      }
> +    if (rv32) {
> +        reset_vec[3] =3D 0x0202a583;              /*     lw     a1, 32(t=
0) */
> +        reset_vec[4] =3D 0x0182a283;              /*     lw     t0, 24(t=
0) */
> +    } else {
> +        reset_vec[3] =3D 0x0202b583;              /*     ld     a1, 32(t=
0) */
> +        reset_vec[4] =3D 0x0182b283;              /*     ld     t0, 24(t=
0) */
> +    }
> +    reset_vec[5] =3D 0x00028067;                  /*     jr     t0 */
> +
> +    /* .data */
> +    stq_p(&reset_vec[6], start_addr);           /* start:       .dword *=
/
> +    stq_p(&reset_vec[8], fdt_load_addr);        /* fdt_laddr:   .dword *=
/
>
>      /* copy in the reset vector in little_endian byte order */
>      for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
> --
> 2.53.0
>
>

