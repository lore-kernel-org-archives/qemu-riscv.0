Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25944C25B4F
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 May 2024 07:27:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s4bhZ-0007yD-I7; Wed, 08 May 2024 03:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4bhJ-0007wx-Tz
 for qemu-riscv@nongnu.org; Wed, 08 May 2024 03:26:42 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s4bgy-000204-QK
 for qemu-riscv@nongnu.org; Wed, 08 May 2024 03:26:41 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51ff65b1e14so4735124e87.2
 for <qemu-riscv@nongnu.org>; Wed, 08 May 2024 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715153178; x=1715757978; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhpqB4afhdNcfZ8uKF6g7sebrO28AFEJ22i0nh9oysY=;
 b=g3isNqcb/H2XDL0ymWQMPEFNU3TLIKg6SGi/X0ynJs8Wjn/pKaQ/tu32RdD6amY3Ao
 F5BKZcHteE5GVowqvQW7caPOtzeQkwuK6fvqZe1ZVKVVXxVNiMVjoW0EcJHnBj7d4egC
 A9vBmjeD5UXpP7lug2pV6mfX8gwdhLcGCWAVaqzLR4UzVzyLIPsX5otNQMiAF2Q8E2ZI
 8coEE+cAeNueOhPm4qagG7rTMT0Lb1znmhBGPt3325WNfyKHm80VQgObPxjk8Zz9kZ5T
 zRnJCkkhckEHoj+uB+czFkTVnrGfjBvjOlI1O19Y8M8naoDht8CbrInpq+H1UpwezjdC
 bleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715153178; x=1715757978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhpqB4afhdNcfZ8uKF6g7sebrO28AFEJ22i0nh9oysY=;
 b=fuiGxhn0nYZ2kG6YOOO7ITOpgaKu2IvSUuS6NVCZbpRMDMOUReqJxYwcb+l5EHv3YG
 zymupVNFOINvF/XBSGgHJeyrSroZaLpyxOTIX+Ps+TFIfiS+w9XBs3ppkcrCQt6LVi7S
 YPwugQYif6ihn+tKm129co1y1C0xPssXm7NtX+KWLNScV3zhvwDCZiBmbjC9o3jGaRvz
 xcCNTXGTytYCFmTgTvxXKXUy7AmSihOWIvBF7yDUaBbNPNjBA9EOhSWYcaGYFskvJ6ex
 myYk8RB3TNFjOi/IAWNlIrNJxQQwiaH8+K1sizIubXobyNJmJM0x3+EDQnGj2gY9J+Cy
 Uoeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrmM48AySSxxGoYD3ZRxX10RR4Bu0bz6qchdM+A7qTkQ2VHbzE5oLpOwpEmBdwADxdNLR459nKP3HKD/sBbhtbZ2yMcyY=
X-Gm-Message-State: AOJu0YzRtXoXIo3kfGTP2cXN12SBB0xom0PVl0itGN9KUcVwkVYJPOkG
 asE/SHmdcENUik3cLbtZgyg65/Ki6mg0PSts+wSpYnYnHURbU1Pkti5RwVdCCcM=
X-Google-Smtp-Source: AGHT+IG/pduzd4ghCVqbCeLsld2w1B3yaqtaMfFvf45FjHQy/ekNqkpuj1SywX0QhHVJxpWV/oZ7Aw==
X-Received: by 2002:ac2:54b7:0:b0:51f:d989:18f6 with SMTP id
 2adb3069b0e04-5217c2794acmr1004621e87.13.1715153178333; 
 Wed, 08 May 2024 00:26:18 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 f14-20020a19ae0e000000b0051dc70a0a32sm2381068lfc.291.2024.05.08.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 00:26:17 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso50508251fa.3; 
 Wed, 08 May 2024 00:26:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxfwoyLwfQ39I8f4aK9TlsFWfUV9+WiAKPvVOLxudzYKHvgP6qwKYAiooJ3gukQRQw8acQ3cls6cTc/X/PD/TYMs5jwEo=
X-Received: by 2002:a2e:9d99:0:b0:2df:b800:5bff with SMTP id
 38308e7fff4ca-2e446d86204mr10824151fa.7.1715153177358; Wed, 08 May 2024
 00:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240307160319.675044-1-dbarboza@ventanamicro.com>
 <20240307160319.675044-9-dbarboza@ventanamicro.com>
In-Reply-To: <20240307160319.675044-9-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 8 May 2024 15:26:04 +0800
X-Gmail-Original-Message-ID: <CANzO1D1hKidUTKeLrWoNsr4oCy_D6m0UEWAPYemFo5MzmJGuLQ@mail.gmail.com>
Message-ID: <CANzO1D1hKidUTKeLrWoNsr4oCy_D6m0UEWAPYemFo5MzmJGuLQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] hw/riscv/riscv-iommu: add Address Translation
 Cache (IOATC)
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Daniel,

Daniel Henrique Barboza <dbarboza@ventanamicro.com> =E6=96=BC 2024=E5=B9=B4=
3=E6=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8812:05=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> The RISC-V IOMMU spec predicts that the IOMMU can use translation caches
> to hold entries from the DDT. This includes implementation for all cache
> commands that are marked as 'not implemented'.
>
> There are some artifacts included in the cache that predicts s-stage and
> g-stage elements, although we don't support it yet. We'll introduce them
> next.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/riscv-iommu.c | 190 ++++++++++++++++++++++++++++++++++++++++-
>  hw/riscv/riscv-iommu.h |   2 +
>  2 files changed, 188 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index df534b99b0..0b93146327 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -63,6 +63,16 @@ struct RISCVIOMMUContext {
>      uint64_t msiptp;            /* MSI redirection page table pointer */
>  };
>
> +/* Address translation cache entry */
> +struct RISCVIOMMUEntry {
> +    uint64_t iova:44;           /* IOVA Page Number */
> +    uint64_t pscid:20;          /* Process Soft-Context identifier */
> +    uint64_t phys:44;           /* Physical Page Number */
> +    uint64_t gscid:16;          /* Guest Soft-Context identifier */
> +    uint64_t perm:2;            /* IOMMU_RW flags */
> +    uint64_t __rfu:2;
> +};
> +
>  /* IOMMU index for transactions without PASID specified. */
>  #define RISCV_IOMMU_NOPASID 0
>
> @@ -629,14 +639,127 @@ static AddressSpace *riscv_iommu_space(RISCVIOMMUS=
tate *s, uint32_t devid)
>      return &as->iova_as;
>  }
>
> +/* Translation Object cache support */
> +static gboolean __iot_equal(gconstpointer v1, gconstpointer v2)
> +{
> +    RISCVIOMMUEntry *t1 =3D (RISCVIOMMUEntry *) v1;
> +    RISCVIOMMUEntry *t2 =3D (RISCVIOMMUEntry *) v2;
> +    return t1->gscid =3D=3D t2->gscid && t1->pscid =3D=3D t2->pscid &&
> +           t1->iova =3D=3D t2->iova;
> +}
> +
> +static guint __iot_hash(gconstpointer v)
> +{
> +    RISCVIOMMUEntry *t =3D (RISCVIOMMUEntry *) v;
> +    return (guint)t->iova;
> +}
> +
> +/* GV: 1 PSCV: 1 AV: 1 */
> +static void __iot_inval_pscid_iova(gpointer key, gpointer value, gpointe=
r data)
> +{
> +    RISCVIOMMUEntry *iot =3D (RISCVIOMMUEntry *) value;
> +    RISCVIOMMUEntry *arg =3D (RISCVIOMMUEntry *) data;
> +    if (iot->gscid =3D=3D arg->gscid &&
> +        iot->pscid =3D=3D arg->pscid &&
> +        iot->iova =3D=3D arg->iova) {
> +        iot->perm =3D 0;

Maybe using IOMMU_NONE would be clearer?

Otherwise,
Reviewed-by: Frank Chang <frank.chang@sifive.com>

> +    }
> +}
> +
> +/* GV: 1 PSCV: 1 AV: 0 */
> +static void __iot_inval_pscid(gpointer key, gpointer value, gpointer dat=
a)
> +{
> +    RISCVIOMMUEntry *iot =3D (RISCVIOMMUEntry *) value;
> +    RISCVIOMMUEntry *arg =3D (RISCVIOMMUEntry *) data;
> +    if (iot->gscid =3D=3D arg->gscid &&
> +        iot->pscid =3D=3D arg->pscid) {
> +        iot->perm =3D 0;
> +    }
> +}
> +
> +/* GV: 1 GVMA: 1 */
> +static void __iot_inval_gscid_gpa(gpointer key, gpointer value, gpointer=
 data)
> +{
> +    RISCVIOMMUEntry *iot =3D (RISCVIOMMUEntry *) value;
> +    RISCVIOMMUEntry *arg =3D (RISCVIOMMUEntry *) data;
> +    if (iot->gscid =3D=3D arg->gscid) {
> +        /* simplified cache, no GPA matching */
> +        iot->perm =3D 0;
> +    }
> +}
> +
> +/* GV: 1 GVMA: 0 */
> +static void __iot_inval_gscid(gpointer key, gpointer value, gpointer dat=
a)
> +{
> +    RISCVIOMMUEntry *iot =3D (RISCVIOMMUEntry *) value;
> +    RISCVIOMMUEntry *arg =3D (RISCVIOMMUEntry *) data;
> +    if (iot->gscid =3D=3D arg->gscid) {
> +        iot->perm =3D 0;
> +    }
> +}
> +
> +/* GV: 0 */
> +static void __iot_inval_all(gpointer key, gpointer value, gpointer data)
> +{
> +    RISCVIOMMUEntry *iot =3D (RISCVIOMMUEntry *) value;
> +    iot->perm =3D 0;
> +}
> +
> +/* caller should keep ref-count for iot_cache object */
> +static RISCVIOMMUEntry *riscv_iommu_iot_lookup(RISCVIOMMUContext *ctx,
> +    GHashTable *iot_cache, hwaddr iova)
> +{
> +    RISCVIOMMUEntry key =3D {
> +        .pscid =3D get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID),
> +        .iova  =3D PPN_DOWN(iova),
> +    };
> +    return g_hash_table_lookup(iot_cache, &key);
> +}
> +
> +/* caller should keep ref-count for iot_cache object */
> +static void riscv_iommu_iot_update(RISCVIOMMUState *s,
> +    GHashTable *iot_cache, RISCVIOMMUEntry *iot)
> +{
> +    if (!s->iot_limit) {
> +        return;
> +    }
> +
> +    if (g_hash_table_size(s->iot_cache) >=3D s->iot_limit) {
> +        iot_cache =3D g_hash_table_new_full(__iot_hash, __iot_equal,
> +                                          g_free, NULL);
> +        g_hash_table_unref(qatomic_xchg(&s->iot_cache, iot_cache));
> +    }
> +    g_hash_table_add(iot_cache, iot);
> +}
> +
> +static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
> +    uint32_t gscid, uint32_t pscid, hwaddr iova)
> +{
> +    GHashTable *iot_cache;
> +    RISCVIOMMUEntry key =3D {
> +        .gscid =3D gscid,
> +        .pscid =3D pscid,
> +        .iova  =3D PPN_DOWN(iova),
> +    };
> +
> +    iot_cache =3D g_hash_table_ref(s->iot_cache);
> +    g_hash_table_foreach(iot_cache, func, &key);
> +    g_hash_table_unref(iot_cache);
> +}
> +
>  static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *=
ctx,
> -    IOMMUTLBEntry *iotlb)
> +    IOMMUTLBEntry *iotlb, bool enable_cache)
>  {
> +    RISCVIOMMUEntry *iot;
> +    IOMMUAccessFlags perm;
>      bool enable_faults;
>      bool enable_pasid;
>      bool enable_pri;
> +    GHashTable *iot_cache;
>      int fault;
>
> +    iot_cache =3D g_hash_table_ref(s->iot_cache);
> +
>      enable_faults =3D !(ctx->tc & RISCV_IOMMU_DC_TC_DTF);
>      /*
>       * TC[32] is reserved for custom extensions, used here to temporaril=
y
> @@ -645,9 +768,36 @@ static int riscv_iommu_translate(RISCVIOMMUState *s,=
 RISCVIOMMUContext *ctx,
>      enable_pri =3D (iotlb->perm =3D=3D IOMMU_NONE) && (ctx->tc & BIT_ULL=
(32));
>      enable_pasid =3D (ctx->tc & RISCV_IOMMU_DC_TC_PDTV);
>
> +    iot =3D riscv_iommu_iot_lookup(ctx, iot_cache, iotlb->iova);
> +    perm =3D iot ? iot->perm : IOMMU_NONE;
> +    if (perm !=3D IOMMU_NONE) {
> +        iotlb->translated_addr =3D PPN_PHYS(iot->phys);
> +        iotlb->addr_mask =3D ~TARGET_PAGE_MASK;
> +        iotlb->perm =3D perm;
> +        fault =3D 0;
> +        goto done;
> +    }
> +
>      /* Translate using device directory / page table information. */
>      fault =3D riscv_iommu_spa_fetch(s, ctx, iotlb);
>
> +    if (!fault && iotlb->target_as =3D=3D &s->trap_as) {
> +        /* Do not cache trapped MSI translations */
> +        goto done;
> +    }
> +
> +    if (!fault && iotlb->translated_addr !=3D iotlb->iova && enable_cach=
e) {
> +        iot =3D g_new0(RISCVIOMMUEntry, 1);
> +        iot->iova =3D PPN_DOWN(iotlb->iova);
> +        iot->phys =3D PPN_DOWN(iotlb->translated_addr);
> +        iot->pscid =3D get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID);
> +        iot->perm =3D iotlb->perm;
> +        riscv_iommu_iot_update(s, iot_cache, iot);
> +    }
> +
> +done:
> +    g_hash_table_unref(iot_cache);
> +
>      if (enable_pri && fault) {
>          struct riscv_iommu_pq_record pr =3D {0};
>          if (enable_pasid) {
> @@ -794,13 +944,40 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUS=
tate *s)
>              if (cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_PSCV) {
>                  /* illegal command arguments IOTINVAL.GVMA & PSCV =3D=3D=
 1 */
>                  goto cmd_ill;
> +            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_GV)) {
> +                /* invalidate all cache mappings */
> +                func =3D __iot_inval_all;
> +            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_AV)) {
> +                /* invalidate cache matching GSCID */
> +                func =3D __iot_inval_gscid;
> +            } else {
> +                /* invalidate cache matching GSCID and ADDR (GPA) */
> +                func =3D __iot_inval_gscid_gpa;
>              }
> -            /* translation cache not implemented yet */
> +            riscv_iommu_iot_inval(s, func,
> +                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_GSCID), 0=
,
> +                cmd.dword1 & TARGET_PAGE_MASK);
>              break;
>
>          case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA,
>                               RISCV_IOMMU_CMD_IOTINVAL_OPCODE):
> -            /* translation cache not implemented yet */
> +            if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_GV)) {
> +                /* invalidate all cache mappings, simplified model */
> +                func =3D __iot_inval_all;
> +            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_PSCV)) {
> +                /* invalidate cache matching GSCID, simplified model */
> +                func =3D __iot_inval_gscid;
> +            } else if (!(cmd.dword0 & RISCV_IOMMU_CMD_IOTINVAL_AV)) {
> +                /* invalidate cache matching GSCID and PSCID */
> +                func =3D __iot_inval_pscid;
> +            } else {
> +                /* invalidate cache matching GSCID and PSCID and ADDR (I=
OVA) */
> +                func =3D __iot_inval_pscid_iova;
> +            }
> +            riscv_iommu_iot_inval(s, func,
> +                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_GSCID),
> +                get_field(cmd.dword0, RISCV_IOMMU_CMD_IOTINVAL_PSCID),
> +                cmd.dword1 & TARGET_PAGE_MASK);
>              break;
>
>          case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IODIR_FUNC_INVAL_DDT,
> @@ -1290,6 +1467,8 @@ static void riscv_iommu_realize(DeviceState *dev, E=
rror **errp)
>      /* Device translation context cache */
>      s->ctx_cache =3D g_hash_table_new_full(__ctx_hash, __ctx_equal,
>                                           g_free, NULL);
> +    s->iot_cache =3D g_hash_table_new_full(__iot_hash, __iot_equal,
> +                                         g_free, NULL);
>
>      s->iommus.le_next =3D NULL;
>      s->iommus.le_prev =3D NULL;
> @@ -1313,6 +1492,7 @@ static void riscv_iommu_unrealize(DeviceState *dev)
>      qemu_thread_join(&s->core_proc);
>      qemu_cond_destroy(&s->core_cond);
>      qemu_mutex_destroy(&s->core_lock);
> +    g_hash_table_unref(s->iot_cache);
>      g_hash_table_unref(s->ctx_cache);
>  }
>
> @@ -1320,6 +1500,8 @@ static Property riscv_iommu_properties[] =3D {
>      DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
>          RISCV_IOMMU_SPEC_DOT_VER),
>      DEFINE_PROP_UINT32("bus", RISCVIOMMUState, bus, 0x0),
> +    DEFINE_PROP_UINT32("ioatc-limit", RISCVIOMMUState, iot_limit,
> +        LIMIT_CACHE_IOT),
>      DEFINE_PROP_BOOL("intremap", RISCVIOMMUState, enable_msi, TRUE),
>      DEFINE_PROP_BOOL("off", RISCVIOMMUState, enable_off, TRUE),
>      DEFINE_PROP_LINK("downstream-mr", RISCVIOMMUState, target_mr,
> @@ -1372,7 +1554,7 @@ static IOMMUTLBEntry riscv_iommu_memory_region_tran=
slate(
>          /* Translation disabled or invalid. */
>          iotlb.addr_mask =3D 0;
>          iotlb.perm =3D IOMMU_NONE;
> -    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb)) {
> +    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb, true)) {
>          /* Translation disabled or fault reported. */
>          iotlb.addr_mask =3D 0;
>          iotlb.perm =3D IOMMU_NONE;
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index 6f740de690..eea2123686 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -68,6 +68,8 @@ struct RISCVIOMMUState {
>      MemoryRegion trap_mr;
>
>      GHashTable *ctx_cache;          /* Device translation Context Cache =
*/
> +    GHashTable *iot_cache;          /* IO Translated Address Cache */
> +    unsigned iot_limit;             /* IO Translation Cache size limit *=
/
>
>      /* MMIO Hardware Interface */
>      MemoryRegion regs_mr;
> --
> 2.43.2
>
>

