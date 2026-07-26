Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF17C531CC
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 06:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnslV-00018S-Rj; Sun, 26 Jul 2026 02:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnslT-00013b-3P
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnslR-0007lI-FC
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-380f3c1b087so245750a91.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785048908; x=1785653708; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=h9zdu+NP1j3pJX5DfF1j9xjunQdsEahMuGk29P1KGj8=;
 b=NazXcapvpdFZIWHENEXn1Idf1lFY9JAtQAv0ZKJszjN/5/rkOU032Jm+ALKOwqdOSk
 7WYhgasC3r0lNu8LCQ84sI0JiFBljxCIf94lxCyO6jtat6SnC8T7Fshz1SU6SJHYjuw8
 fFzSNGV8gsclGuUWJuByt/c4JeOugQUDFHiGQvQrNbLfVWZsrV7+uIWIsYxNuHcZAe+B
 A/lbTg+V4gedwce1jSx2gWAvkCfehbUwSEiQIpi/LWtC05jOiaTnAhjm0sb4cA+iqYgU
 x9+IsIccnjV0YYrQFH9971r6cMwc3N3r0OWLWBLQBT91g1sGUyipYG3zkdJnjpv5Qx/z
 3K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785048908; x=1785653708;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h9zdu+NP1j3pJX5DfF1j9xjunQdsEahMuGk29P1KGj8=;
 b=EGna2DwYyYuPAGgjGRKqK/ZlSLmPLafAcx6S0zAdVsb3EukHi+C8fUWucdTDDu9ctM
 UpbGq5MafXdtmt61V8/LSEYfbDNfoJKAZFEdbMeZjacTrAmV8F5+Z0Mz60smFhIMFtNS
 1BlKupTle9FOa3xKRH7Z+c86AXnEytDeWcoZ15FEWdZkVvGKrVj5sZ0lfLmVnjz9fOwl
 +FsaEcgUlcbirfHC55wnAnxWbot1+b7zG/7Z6NLskehHDwSIzpYdgNvAxeyEGMWELgc9
 Wd0v9xEH3oDLr83krqs2n0U+leTMApLmjjU7c9EQPEAl4mU2tmgyDlbsstX0OoIyBMRN
 WowA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCJpGRnQHHnprKG5vrDKqOqzqYJWITuybgaeY8E16ErkP3W1zY735Yr8lOEaB9JADS+NAkLuylkCCQ@nongnu.org
X-Gm-Message-State: AOJu0YwCkuyGR+/Dg5ZgA/6VEcRNKv6RbflEEPigu+2STRQONZkWsJwo
 ZQnLidHM5TJhBfSW6L+dCgePk2/u3igein5s7PT/JKLVdMvxjkBy11tbAFpEar1jezM=
X-Gm-Gg: AR+sD11l4jFJCOl/+7B9DGLIoXq2J7q2/QJLW/7XcBIsElSekukcgOO42PWkwI/jPPL
 JqXb/leXl/8MUaUgr3WAj0hTzc2HHEpsKkU9+HNROvIOqkCNw29YlAUNVJlSlZiueOg7EBUQyTO
 +lEE1HMSb/Hkgbyyc4VIkdJrn0stg70/gAO3PzwthFHXp/UerSG8WpqGDZSDypAp00ufg4Pp9PS
 wPpt/THJEU0xflUvBYVXXPhUuhomgIRLuaKIf6M4f67FcJnVo4HyQ6qTPtfD49K1EInhAwdHyTX
 oIDjxWVb8/dmzLw2Sfn83PBEil1jBZGMK+U9HTuGD+AmmJOlZm/jqZwttdB0ZsdZxbr0eOB3pis
 1rfAG1A7rVs3ACENVvsjP+KjMJUoYT58XJ9pxFgjQJoswzsLN0+g9prD3qdpo46Boa+32u8H0UB
 xXDZjbtv9mO+NsL3Nh8sOV88FrSL+ExEw=
X-Received: by 2002:a17:90b:5625:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-38f296051f1mr2992609a91.4.1785048907783; 
 Sat, 25 Jul 2026 23:55:07 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc44cb92sm29618246eec.13.2026.07.25.23.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 23:55:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/7] hw/misc: add K230 decomp gzip
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-5-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-5-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 14:55:01 +0800
Message-Id: <178504890121.906524.9693776132093948045.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785048904; l=3006;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=GoCpHz0Ytch7ChMSVIBpBkVEYuEezmBW4tyXDiRs184=;
 b=DXMBSWjpFDyr7rQKx+MjI7qj09rgF7fzuMBuYwwVFoT/mbfXQF9kujO3VBVgjYfp96B+UFioT
 FYihtMrltrbC+YTXUyv7eq+scOravkRTYiCPzYX3J3Y6aGaiSqrpnq4
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=caojunze424@gmail.com; helo=mail-pj1-x102c.google.com
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

On Wed, 22 Jul 2026 00:13:32 +0800, Tao Ding <dingtao0430@163.com> wrote:
> diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
> new file mode 100644
> index 0000000000..4284262259
> --- /dev/null
> +++ b/hw/misc/k230_decomp_gzip.c
> @@ -0,0 +1,498 @@
> [ ... skip 184 lines ... ]
> +                                        s->output_buf, produced)) {
> +            return false;
> +        }
> +        s->output.current_offset += produced;
> +        s->total_produced += produced;
> +    }
> +
> +    if (consumed) {
> +        s->input.current_offset += consumed;
> +    }
> +
> +    if (ret == Z_STREAM_END) {
> +        s->stream_end = true;
> +        if (s->total_produced != output_size) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +

The current implementation calls a universal DEFLATE decoder, which natively supports three BType formats: 00, 01, and 10.
Based on the K230 technical manual's semantics, the current settings support the Dynamic Huffman format. 
I believe we need to add a BType==10 validation.

> [ ... skip 109 lines ... ]
> +    if (!(s->gzip_src_size & K230_DECOMP_GZIP_CTRL_EN) ||
> +        input_size == 0 || s->gzip_out_size == 0) {
> +        k230_decomp_gzip_finish(s, false);
> +        return;
> +    }
> +
> +    s->active = true;
> +    k230_decomp_gzip_update_ctrl_en(s);
> +    k230_decomp_gzip_kick(s);
> +}
> +
> +static uint64_t k230_decomp_gzip_read(void *opaque, hwaddr offset,
> +                                      unsigned size)
> +{
> +    K230DecompGzipState *s = opaque;
> +    uint64_t value = 0;
> +
> +    switch (offset) {
> +    case K230_DECOMP_GZIP_DECOMP_START:
> +        value = s->decomp_start;
> +        break;

Bit 0 of this register, decomp_start, is write-only. I believe the semantics here are inconsistent with the manual.

> [ ... skip 124 lines ... ]
> +
> +    memory_region_init_io(&s->iomem, OBJECT(dev), &k230_decomp_gzip_ops, s,
> +                          TYPE_K230_DECOMP_GZIP,
> +                          K230_DECOMP_GZIP_MMIO_SIZE);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    qdev_init_gpio_in(dev, k230_decomp_gzip_handle_ack,
> +                      K230_DECOMP_GZIP_NUM_GPIOS_IN);
> +    qdev_init_gpio_out(dev, s->signal_out,
> +                       K230_DECOMP_GZIP_NUM_GPIOS_OUT);
> +}
> +
> +static const Property k230_decomp_gzip_properties[] = {
> +    DEFINE_PROP_UINT64("sram-base", K230DecompGzipState, sram_base, 0),
> +};
> +
> +static void k230_decomp_gzip_class_init(ObjectClass *oc, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = k230_decomp_gzip_realize;
> +    device_class_set_legacy_reset(dc, k230_decomp_gzip_reset);

This interface has been deprecated; please refer to qdev.h for further details. This issue is similar to patch 1/7 (actually, it's identical).

-- 
Junze Cao <caojunze424@gmail.com>


