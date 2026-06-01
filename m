Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E69CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:00:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtpM-0008Gl-Kj; Mon, 01 Jun 2026 00:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtpE-0008FB-HG
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:00:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtpB-0003lX-Bl
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:00:28 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bebbc325000so129522166b.0
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 21:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286420; cv=none;
 d=google.com; s=arc-20240605;
 b=Y4RnDp1srdo576jyut1nHUVVfKHPxLdNW/palqz+9M36UZmsg2TCw+Vz+9p8Pnre7M
 /oqe51AfGVN3Gb+4EwqASgBguurcmKklsxHZLaUqcU8ITX7BooR2hqJlFJcuLiIrFfC2
 S6QkSl8ZKqT1gBhuCB6uxNbr05QuC2IapQwHx2Giw9gnyQI4EsRD4torHRDdFnZwRvGF
 igQanbzCaSJA9nQekElDz0UE4dW93/bXXxyQ5WbXrVFhfPh6ClzbCjtZm+tRF6OUvmsD
 78sNPwPcQwY9uPKEn7dfDTvvOMMgQXcx21n1o+jMCxwRwADhoXoFhlKnqB1rz7xsIx6j
 GUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nIyi+hxkqvLTTnRYGo1qqkrTfklxpXD6EopCH7Zar5o=;
 fh=h4/TM/YM0hAu0VpCEsVSPDYq6fQ7X8UGeDbDsmMQnQY=;
 b=ag8hn+N2fjnjvu9V33VEQsSpEVm5GFGDJ85PsfmGPHHQqoaP2/9CVoA9jbGZAXAKAe
 gzcept6hsnlvktGxelNWmvrc7+IlZehFAtz5v8BN+XV3G2pcQyIbutJN0RPbHxoCnjY8
 58zoAiMXqYyCxaeM570XRZVbwX9p1UXtkzGIsQmQBJ3cPnwtP1N0GmFC0lIdJbW/wNml
 E1xnIOpFfq9mhJWfzNYtBZ7lSCngXkqbnwr/gBsZIpuKbeFLBZGihodIWQUBT/LI15fC
 7Qd3x/Og/D0pdzUnkJAQXx5S15MHTh1nGUkYLWcCJbKaXDoiyDYGASh02uIAHShF1MdP
 TlVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286420; x=1780891220; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIyi+hxkqvLTTnRYGo1qqkrTfklxpXD6EopCH7Zar5o=;
 b=QXYMKehhs/6i12pX3jt77KEP843AXsF4SpTt8neFjd93/7aEn3Ah8fBDJVk/hbQfdM
 4TVR8DvzuRFE9+ipsbzuOQzpOl95uAZhcVOlvNUgGPHNPzzS9HtWIvkR0oVV0SSj2+gc
 LdmMFf0CJJk6K7XSxt/2WXlQxdLEJwAO1zBUrsBquFqyw1JAyTA0AjRqoaYGH/Wm152J
 4X7K13cBCX73xDi8OmRhVa4Msb6TsNz3Px2A1Ixc47BxjxhiRVGvSKxqLJfiywiMgvFm
 EoJHfFKUVckWVziqqqjmdR1LRstjRW94X3HBccreqezKS+Yic+W2olAH8hFIpvtcEscn
 z2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286420; x=1780891220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nIyi+hxkqvLTTnRYGo1qqkrTfklxpXD6EopCH7Zar5o=;
 b=Mw1FHBVF8XXUWXUDrKVezX9uq1n14g89KLovDjIg1XXxjwxOqsdBmhMqm3SPGUZgXi
 AOvwpW14FrgQZ53T+/hkSzr3TpdADeciDxcs+MBu0/7zkJlQsmosO9N+TpW4PLYhgvqr
 JmdHApTc6g7mdC1R+JNRUmcdcx5IOKc5QyJBYGW0y4L8uGMU3a+FbyXClAlaXgr6rm2D
 pf+LgBM/ok15ARPnmHl6hgEPsr4QrO9Aa2lVnrhfYTrHhlEe7WgtFmER9n7rmkyfHGAr
 ef5ScLzKLaFq31HeFjrwRAeN6gMuWCU/FXYkCyPhUPHbW4p3ExVKM34N2OI6sG9uVOey
 Qb5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2bhmxViB2vZeDaTb4Lk6rt9Vbox3o2Mr6SHvNGD/x4mWo+2cvpK2vlsdC5/6HIbN3ekGhVyjZVYfN@nongnu.org
X-Gm-Message-State: AOJu0YwlhsGOB/7e4Mc1gzi57lnWEbwiuNs8GGfYTP5+BknVALMpGLrX
 Y7v2qCdeQiz/cb4TuGDpipG7eWTbXhuJ1X8dOurzt8b/XsU+6zFOex5hiioIATuKVT/artH7Nob
 Ri+hmYUoeEm9GBKCMcpneExloejTomgo=
X-Gm-Gg: Acq92OF2MvgdqkZCtrGT1APF/kF3BzqwI2san0Ink14el733QthUDXdjW4Gkkm7BW8R
 SUtJpK5+1vU0xXjrZm5kD1SJnKtB82xnJ3KwarLAw86kQJwL21b1eNSu2XNfsKj+0LJUXyVp7jq
 Uyz75vcCjQjocLUObG6727QOXqeEX9MI5Bj6UOLiYFkVga3+7TcmNh3GULzskUF63xFX0lF61DK
 smJbgazi7ffr/2UQ32soNDCuVbVGNqqt0tLPNniabCIs2SI883BhBEt7M7GUcYX/V+dmbISy14q
 Xe/tYhEUXy/04r9YMLvo4k4DwycPgJnFSkWSynFeEAC9JB+X
X-Received: by 2002:a17:906:fd87:b0:bea:455f:74e2 with SMTP id
 a640c23a62f3a-beab3851b3fmr497018166b.16.1780286420497; Sun, 31 May 2026
 21:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-9-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-9-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:59:54 +1000
X-Gm-Features: AVHnY4LHjIE49wd1NbTGt4RwdmM2_H-PKYCeEYFoVzbeERdyoyvaCpfK3GYgOE8
Message-ID: <CAKmqyKNswZsgk2O3J_sm4wm7Q_mZrc7RkqSovhUrPoxW4gn-4w@mail.gmail.com>
Subject: Re: [PATCH v11 08/12] hw/riscv/boot: Replace cpu_to_le32() ->
 const_le32()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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
> Rather than adapting the array endianness when it it
> filled, directly initialize the CODE words with the
> correct endianness.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index c6ab1cc8cfb..4297949f6be 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -454,40 +454,36 @@ void riscv_setup_rom_reset_vec(MachineState *machin=
e, RISCVHartArrayState *harts
>                                 uint64_t kernel_entry,
>                                 uint64_t fdt_load_addr)
>  {
> -    int i;
>      const bool rv32 =3D riscv_is_32bit(harts);
>      uint32_t reset_vec[CODE_WORDS + DATA_WORDS];
>
> -    /* .text */
> -    reset_vec[0] =3D 0x00000297;                  /* 1:  auipc  t0, %pcr=
el_hi(fw_dyn) */
> -    reset_vec[1] =3D 0x02828613;                  /*     addi   a2, t0, =
%pcrel_lo(1b) */
> +    /* .text (RISC-V instructions are always little-endian) */
> +    reset_vec[0] =3D const_le32(0x00000297);      /* 1:  auipc  t0, %pcr=
el_hi(fw_dyn) */
> +    reset_vec[1] =3D const_le32(0x02828613);      /*     addi   a2, t0, =
%pcrel_lo(1b) */
> +    reset_vec[2] =3D const_le32(0xf1402573);      /*     csrr   a0, mhar=
tid  */
>      if (harts->harts[0].cfg.ext_zicsr) {
> -        reset_vec[2] =3D 0xf1402573;              /*     csrr   a0, mhar=
tid  */
> +        reset_vec[2] =3D const_le32(0xf1402573);  /*     csrr   a0, mhar=
tid  */
>      } else {
>          /*
>           * The Zicsr extension has been disabled, so let's ensure we don=
't
>           * run the CSR instruction. Let's fill the address with a non
>           * compressed nop.
>           */
> -        reset_vec[2] =3D 0x00000013;              /*     addi   x0, x0, =
0 */
> +        reset_vec[2] =3D const_le32(0x00000013);  /*     addi   x0, x0, =
0 */
>      }
>      if (rv32) {
> -        reset_vec[3] =3D 0x0202a583;              /*     lw     a1, 32(t=
0) */
> -        reset_vec[4] =3D 0x0182a283;              /*     lw     t0, 24(t=
0) */
> +        reset_vec[3] =3D const_le32(0x0202a583);  /*     lw     a1, 32(t=
0) */
> +        reset_vec[4] =3D const_le32(0x0182a283);  /*     lw     t0, 24(t=
0) */
>      } else {
> -        reset_vec[3] =3D 0x0202b583;              /*     ld     a1, 32(t=
0) */
> -        reset_vec[4] =3D 0x0182b283;              /*     ld     t0, 24(t=
0) */
> +        reset_vec[3] =3D const_le32(0x0202b583);  /*     ld     a1, 32(t=
0) */
> +        reset_vec[4] =3D const_le32(0x0182b283);  /*     ld     t0, 24(t=
0) */
>      }
> -    reset_vec[5] =3D 0x00028067;                  /*     jr     t0 */
> +    reset_vec[5] =3D const_le32(0x00028067);      /*     jr     t0 */
>
>      /* .data */
> -    stq_p(&reset_vec[6], start_addr);           /* start:       .dword *=
/
> -    stq_p(&reset_vec[8], fdt_load_addr);        /* fdt_laddr:   .dword *=
/
> +    stq_le_p(&reset_vec[6], start_addr);        /* start:       .dword *=
/
> +    stq_le_p(&reset_vec[8], fdt_load_addr);     /* fdt_laddr:   .dword *=
/
>
> -    /* copy in the reset vector in little_endian byte order */
> -    for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
> -        reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
> -    }
>      rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                            rom_base, &address_space_memory);
>      riscv_rom_copy_firmware_info(machine, harts,
> --
> 2.53.0
>
>

