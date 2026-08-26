Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A89C61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 14:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzF0e-0003cZ-PO; Wed, 26 Aug 2026 10:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wzF0d-0003c6-Iv
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 10:53:47 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wzF0b-0008AU-Or
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 10:53:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8200b55dc47so15955617b3.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 07:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756024; cv=none;
 d=google.com; s=arc-20260327;
 b=gEGQmj7l6HHMPpFhFhfB1jDF468NAitpVfQtnb5MqsjGgMvC5N0a0jlaG113v2mhxq
 5p5YudVc6LgIWvriKHbm2C10sNMfg2/oo7h2CmDo5TeIxm2Y6zxJC3hloXoyt5SSE9gm
 ChTF54W4/3i39jWhFnlVp63wR+SbshyQKJaXoFyaA65k014dfo+IgY2Oyl7pCQKDJvMQ
 zF7ZsggJHV56zjdyCFrBe7WVnLoIHh7hYQNCtuD9oU302rMKr4f3aT/ydStVVq+s+dCy
 9mRV4jZEFEbs/544TVJ7SdcIWlcY81rbdhtuMtPwEFfoGsgPx4yB2To9/Bqk1mBJpZ7w
 Z9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hc16r7tXsZNKAaOX2hV1JeHhZOQ74MMgxV1jAOkO/WA=;
 fh=v3FkjRDOstp+p2Kx9UAltc+tpcsVz49ITlTIcLetNAw=;
 b=gODm/yh01YsQP3ltANIiidmJTiaJ2mCAw2KmgEg50rybW5I52LDZj5MTFQ6Rd3ABUY
 fssGI7dQJ4qj3UcaK+lUpP3IPFoDa7U/nkkfqDuanp3KGCVHoGmErxgtfyZbxONczPz5
 uTZ2ehopr2qU+wuWfdxzm+i6OUYtqa6VD51E2Ekdlbq1YhngsqbnbRNfvI7JXEoaIpMj
 DmcBy39Ey6PRzTAySunmkoZaGo7bSjSFEFpiQgBPFxg5BBdL2ilyr8fxi/AwA+XX6QPa
 U11uvnLHZiENxxBofg/Hf2znan1V6QJ2hFZkWgcazzSFmdWOz5hwYYNcy6NQrcn9x2yY
 +rrA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787756024; x=1788360824; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hc16r7tXsZNKAaOX2hV1JeHhZOQ74MMgxV1jAOkO/WA=;
 b=B0ZbnTEX7jIYTJv57s2JU5CZhAv4q5EJ4fPdENQEq8P2jCsAX1O8xUG/TN8QXUPd/t
 oNwai7e1HaYz6pTHsSVKOwNSpB8C0zfHX0POo1jwdZiyWs97rRFkzUkSzkMvzwF+oxkJ
 VE5Pvg2Rk9aRknqb+ZWDGOTqcnF/j7jw6ipF0KkI1aHWrlDYSHI8A1/S1OqePExbC6r2
 4IrxTj8y/4gcyS833XPr7QXpPIAKy96UoLXOZDovdu+6tlMM2PPKnzJZwwTTW6jRmX19
 6bi3+jApldBeia6rHaJ+pDgs++m5ZL8odW4wMpx0uUYVbG94t1u3GpC7TJP8mICYqAch
 m0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787756024; x=1788360824;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hc16r7tXsZNKAaOX2hV1JeHhZOQ74MMgxV1jAOkO/WA=;
 b=in8mU0yr92sCiH9LUeNsvyRRgwGLJAlz5BZY+9jEskTgxk/EkTyKDBshxsZHzIdtjF
 b92MMFvbMtQR2iPB7K1625FgnBI0KmmEDrER3vXRUJpp3FtggQoc6waYT7LsE3CHQDDT
 DI9o2fJmFSZyVobRBFcFqcLcio99LCSE8rqeznMta4k0hpBa9uev+wRkX5eghtI9WgwH
 FvMGko6nGB4XkTahYZt9HKVEbBosTYqXuNVLZmhOO4drMmkU04aqZd9XXeZHsj+I3tAu
 o/vdL2R1eIsEF5fz9CppuoDDBC8evhvp7Up0WxRW7s6n8peqCL8Xz8acV/nvJQKG3udH
 zF5g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpW+dpXUVW8OsFahF4ySzWiTOHwXIEJ6+eoIELdZOmKkYmNzSOiqw7TacvSGLf7vrTEsumGUZFUWsR6@nongnu.org
X-Gm-Message-State: AFuF++lzeFJkW6F/awTGB0QCK+d987K40TTszzNb7g+n8MwGfeJpiVNM
 6LvxrcDjHmz7PnYdiPnwq1HlHoy2lLs7n8ABqD7Ui/deKDPw0QGzhpBvVeKxGcFFIVfAjbCRjiC
 vA3x4lXfdJBggYEfTTr7QGF0zYMtvdzMJu8XQ+66l9A==
X-Gm-Gg: AR+sD10Py2zhNNX+44HCmDSq+xFax4MHKodi/tpDDZ9kk6XtW5YrCiyuT8HoDhQVknL
 J2Msox8eCVNLyNE1V1z2coz5Cn1U3mEgjtBPgr+cY62j/AvcU/nnS/hDuoNsw3k1uwEx3UIvPDh
 qlhredBwYmK6dJi/YbJCknfH8De0xvipoPm7e+zS7a56h32Ci9h9+6bA585ssO6Zu01txo1c/vu
 /gEquVSPDiuUPHP//Uc3oB0SmeAmRfjZaOJ3hBQ3LlPQOK7W6yFCUuOIut2Uaq6W2aplVW+rrwU
 X3Kal261KrweVBAxZ2SfE+J6UKdPXGayWHFj88ey0bvhn3rq3ITBnGx8Bfqy5ZWxSBYmpcyROaw
 =
X-Received: by 2002:a05:690c:5805:b0:80d:a249:4854 with SMTP id
 00721157ae682-857477a3fb3mr26241607b3.17.1787756023981; Wed, 26 Aug 2026
 07:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
 <20260825212326.1907-9-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260825212326.1907-9-daniel.barboza@oss.qualcomm.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 26 Aug 2026 09:53:32 -0500
X-Gm-Features: AcwNN1WhnBunGvND0aWLVyi0Wn_SoUe4nlBvtFW5I7tnt5C1Z6pOW_OzhdsXsdI
Message-ID: <CAEev2e8fbPt04kcKh5a+ohXYtWPzC5-cD58gcMFS-NV3QQKwSw@mail.gmail.com>
Subject: Re: [PATCH 08/13] hw/riscv/fdt-common, virt.c,
 tt_atlantis.c: add create_fdt_uart()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Tue, Aug 25, 2026 at 4:24=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.
>
> To accomodate both boards the helper is doing the following:
> - an 'additional_reg_props' flag is used to control whether we want
>   'reg-shift' and 'reg-io-width' elements added.  OpenSBI won't boot
>   with the tt-atlantis board without them, but 'virt' can't deal with
>   them being added unconditionally either.
> - an 'is_serial0' flag is added to control whether we need to set
>   additional properties related to the first serial.  This is required
>   because the 'virt' board adds two uarts in the FDT.
>
> No FDT changes intended.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>  hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
>  hw/riscv/tt_atlantis.c        | 21 +----------------
>  hw/riscv/virt.c               | 44 +++++++----------------------------
>  include/hw/riscv/fdt-common.h |  4 ++++
>  4 files changed, 52 insertions(+), 56 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index f31cc9d3cc..b3f3af3762 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -791,3 +791,42 @@ void create_fdt_socket_aclint(void *fdt, ACLINTFdtPr=
ops *props,
>          g_free(name);
>      }
>  }
> +
> +void create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
> +                     int uart_irq, int aia_type,
> +                     bool additional_reg_props, bool is_serial0,
> +                     uint32_t irq_mmio_phandle)
> +{
> +    g_autofree char *name =3D NULL;
> +
> +    name =3D g_strdup_printf("/soc/serial@%"HWADDR_PRIx, uart_mem->base)=
;
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 2, uart_mem->base,
> +                                 2, uart_mem->size);
> +
> +    /*
> +     * The tt-atlantis board requires these extra props in the
> +     * DT, but adding them unconditionally will break OpenSBI
> +     * for 'virt'.
> +     */
> +    if (additional_reg_props) {
> +        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
> +        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
> +    }

I think the issue is that atlantis uses a uart that has 32 bit
register spacing (0x0, 0x4, 0x8, 0xc....) rather than 8 bit spacing
(0x0, 0x1, 0x2...). So rather than "additional_reg_props", would a
name like "word_addressing" or "32_bit_spacing" make sense?

Regards
Anirudh Srinivasan

