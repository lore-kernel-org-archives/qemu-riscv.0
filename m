Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70545C5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:44:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSun-0000fQ-6P; Thu, 27 Aug 2026 01:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSuk-0000f6-Ta
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:44:38 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSui-0004ph-BD
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:44:37 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cc1cb472b76so1189152a12.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787809474; cv=none;
 d=google.com; s=arc-20260327;
 b=ryH0dqYy4x/EbEhcaPLMt+qFb+NKFbuKC49k/EjahqPiQ4bnWCpeJYcP3kRkMR2db5
 xQsvWOIy63Y1AGuXThluXzHU9bh0+YGiJn8gXHNGoqkqrYxnMzIpbmWZPoJPLGqk+ZE7
 V2oxngB4ueJXtuQKwMMMjbfsO5Kzi+uMZqxow6gYN42Y5Ko7XPz9+emi3XkAhOeHsvht
 F8hbaUyE5zlsdfYyuJE6ZYSsd+RyUULdX3SX7ZfFwhSkNDKndM+0I5upHEtfaKBTSUjW
 Onz2SpuziYyO/qBugUJbCDCgPm5vkzETkI0m49k8t5nrcQSewj7Bmu+/gOonBFu1omt4
 UjsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AbYlBgUjv2EsZ3ymdlepPEsbU8BxbkPUJDDwFWNpzsE=;
 fh=VXDnlD2fEFEQLPv8VuBB4A8RsvZODCexsb0sP0oGjzI=;
 b=HLRQAN9gFNgGIfn9zZCxGvyi4s8rhshnLgTab0PqYs0uykYjfh6HdpOu5XNHxD6YMC
 d1sXR402DsHst2CsEfxHeTwfVfytt/CQM9qsT4XUkiLfcq+ZEC6LNSWxrhfksX5Ek8Oq
 LttY5i2icEhxxqFtKVEOtOUVpg8ExcqIAZ0Lx2io8+3TvagIieU+w4H4xE4b/SUy3Vi4
 /d3ZBX6RcFePyei3P+OjLLbxZ0L4gd1QmUnrYYDzotKsrwPiUaGC7ANC+fhoZDbaw1pt
 maR0dGQgj/cwGj6WunBU/M2dGsVr+KJo5ac9QK7HTU3WBxKOK1C1t4TiWMlv0on/RuQO
 dfsg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787809474; x=1788414274; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AbYlBgUjv2EsZ3ymdlepPEsbU8BxbkPUJDDwFWNpzsE=;
 b=NkiD13PMLvqYajOsRL8XnkDbUN37f+jzvnrblLgSrKuujazVAVW9kULzvbbrtHII2h
 Hm1fAnTrT2PQ3rcSIrDOjPT2EehTUymIuTUa2SWpf1nemoaXoVVs0XURoZQnFde6Cqna
 aALzEDazXkvvVOjCW3g8eAkcu+Mt0SW6r1luY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787809474; x=1788414274;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AbYlBgUjv2EsZ3ymdlepPEsbU8BxbkPUJDDwFWNpzsE=;
 b=l2X6pwvXYM3GwJ7ToysMNEcfrpSc4J2h0cu15ShfZ4FlwDWWTzapxJ9h3Yqq3O+p4/
 vAt0i34iag9JYQIX+CpicF5FAX+kb3lQWWj3j2p+G7rS0A/iAck/WWRTjdPKfHGKlLM2
 7HWaxIDaRuCkv/fXzYjCi/mWPK4uskUHLHMPSEpEStei031nVB2/n56yYXdI5CTgLEId
 hXHsRyZ3levKhQb1m9qcdWHv/R9IzzUdte/XUpB2BjmbCkkLuNJXPG1hpPWz0UmwVciX
 7LvZCYbH5D9Gbmwielda2wBGZJmfTXhH40OTse1VT0cUAM+3pAdoGyYOeRrvzpNcjpGQ
 8ndA==
X-Forwarded-Encrypted: i=1;
 AHgh+RosjlMTxk/LEH63Qq3hTGJNMdK3YXIpbxkGncXCaf2Uv+aIom7pqBKhvQyVj6jbeDFtIKSexJXBj9fr@nongnu.org
X-Gm-Message-State: AFuF++mtqBiF5VDB+FNyGBUXQM7A9Uwgh8iKFWqLkNN6DS7AnDXvknPm
 xGTRwrr22vNk7h+cY+AFbGNYW3DwERzIW5S1iEZ5XC98IE8dgS7Bx9zkQ9AhyuQXWX6yLMZr20c
 qfZ8JGDVi9abOqlEHS7wGC0PKj9bHFMU=
X-Gm-Gg: AR+sD12iDbREqT6KrQOdGMCIC5itzKWjlb1SqXMgPNgfFymjT3jn4WLVUdoVOLzGr7z
 wQXuW8Mfc3J/nVzNmv68//OHpiVYUx86r6tLJc5XguHVIqSWkD/VsOTx4tQAt3LZPym9fys7DA1
 mMlz15u0hIymhFsANdccYjYWysNbkZX1VNlRHOSfgaJPwQA7V3v5Lu7QvatCLty3V9/GLx0JKGG
 U74WHayBM4M5Sj7IR928mopf0odsS7diTnp/ZYsTZpYJE+f8iFbpUvJlNjjnXBunyYLS+EsOzQM
 5G08fJeUX87zRKqDdB6vy1oxNshFJGFV0/Iy/ZxtvILs8jojHc4GeIPhkTbqnxtPLmoa7/G2V/D
 kf3hM6zhyiRl6t1ptUGwO0cQKt9AHXJXWtP/lmFtfhoEa6La1Gfl/E9Cx00oUgQO2VxI3Mg8+Zh
 0z4r7bG7FsEFChg1NP6tdre8Z2zto=
X-Received: by 2002:a05:6a21:b8c:b0:3d1:2f88:913f with SMTP id
 adf61e73a8af0-3d12f889786mr7232912637.14.1787809474130; Wed, 26 Aug 2026
 22:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260826214643.122728-3-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 15:14:22 +0930
X-Gm-Features: AcwNN1UnktlU7wPe1G16IDdCEg99MmZQ9rm71p78Iisxm9RRK83A_WS_MadRcGI
Message-ID: <CACPK8XehmqwQVKjvfGNdVQjApBQJNxrO0JHywabqRUiucCP92Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_flash()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Thu, 27 Aug 2026 at 07:16, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add a common helper to create a cfi-flash compatible flash subnode.
>
> This change only affects the existing 'virt' board for now but it will
> be used by the future 'riscv-server-ref' board in the future.

Why do we have two flash devices?

(I know why ARM does, where the code was copied from, but why does RISC-V?)

>
> No FDT changes intended.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/riscv/fdt-common.c         | 12 ++++++++++++
>  hw/riscv/virt.c               | 18 ++----------------
>  include/hw/riscv/fdt-common.h |  1 +
>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index 3a8da03cfb..6fcc1ce21f 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -283,3 +283,15 @@ void riscv_pmu_generate_fdt_node(void *fdt, uint32_t=
 cmask, char *pmu_name)
>     qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
>                      fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
>  }
> +
> +void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsiz=
e)
> +{
> +    g_autofree char *name =3D g_strdup_printf("/flash@%" PRIx64, flashba=
se);
> +
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 2, flashbase, 2, flashsize,
> +                                 2, flashbase + flashsize, 2, flashsize)=
;
> +    qemu_fdt_setprop_cell(fdt, name, "bank-width", 4);
> +}

This is a copy of the code in hw/arm/virt.c, which was also copied by
hw/loongarch/virt-fdt-build.c.

