Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBC8C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:55:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzT5E-0004Js-6X; Thu, 27 Aug 2026 01:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzT5A-0004JY-8v
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:55:24 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzT58-0006zz-Ah
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:55:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8486ac3f347so696886b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787810121; cv=none;
 d=google.com; s=arc-20260327;
 b=nj/RVDrFbFWYCP6NJIqJmix5sZ23nbrSgkNvRXodCVOV6VHhiABhRYTaqsmaZVTpGU
 1TKp8zEEkLQNymuq94pPwdNGiLKpc3P/nQM86U67xTWb6lgS5HNS8UlnGqu/ZLDvc0pU
 y1sspJTS2hyZOJKSsJWV/CN+MRBSEEbSjlERcmSDxdTomRgyrlQTKOuLTWEYRD2gKKif
 F40KzFkdn4fnOYPqpBnPI+KB3YAQQi1Ltn42nhhZtitJJHM7nw5/2gfUOU/RShNC+kGT
 qcIhpk1EP6DbbJL/wkuH4JtRZGPvp797r0jbordiowCXNQ50Ef2OPt3kcEfmL9EiqGEB
 yVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hNDdHdJQii9xS9RObhFAPMFYRZPxzrhOTdKefGyffYc=;
 fh=SVZ91FISYjFoymJhDmBuDmncbm2Yv7cIcyirfjedju0=;
 b=PkdLevnXzy3yrlsS1FhAdV0MWFz9yzTXpbpefGdd8fcIDLJCkDCPxKydRQ+JZ5al5f
 bTQQc+OyS2KBuhMhTvGy6VqLTgEmpqEYZu+MPGtBODSccFIt7mqsvKkxJszf8ErJi6Dw
 2R4OsqMXOmeXXIYrJvVMzw30PthVHcq1ajmW84OUacBmlGjBUaSxDZ4zjmgIqBrk+ROD
 zMz1vdAOlxyXnsLbNmQF4+dkDpBtIjssY0DovwWG5DWZAsm3MxswdSlnxz0EHBGUU/gS
 TTjS8TMiuuJUykix6IABjXm2fTZcK08vCLQYmEyVKO6Ku0pI0o9bPBidrdj3FPlMK6CF
 SX9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787810121; x=1788414921; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hNDdHdJQii9xS9RObhFAPMFYRZPxzrhOTdKefGyffYc=;
 b=EmDlIJDp+046Gs1lb4w1e/9i2qscbO/9aRsXzmpKSz0+Kym9yYrjJV2Rdo4jHOl9SY
 5TRHE106273nYpvQcTPk6y6JlwG6+LcRx4LpZVKxU/S4VBPewo9rB5vtou0TKe1zfpOu
 G5N8t111ASzvP4dY4rr2fPOLIqChs6sSEUbUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787810121; x=1788414921;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hNDdHdJQii9xS9RObhFAPMFYRZPxzrhOTdKefGyffYc=;
 b=A/FCNVZSDJdNbNtj82xQIMXRSxpw7OfRLA53zuxf+EGKJj6UU0a7Qx0tLf3M79nu7j
 FWaQ7P7Udb9Nspa3E/c5U/0dIHWeS8yM3UQjQaejitOl0+bawn3vPJeB7UH6A5MRIwNE
 7maoa3icUze/wif43e1Myzj2BcRuxuxkFUE7qmgHGfD3vwu0wqMdLxiEchRHeOkex0uM
 QzuodLLojRbIvAOMYDFLqQ5QbRfN/ygY3CpWXKXu4GsEwNjC0cZkUIlvZJh3tQlqpCGP
 asY5Zqk5A8+7hBpoSLIAYI46y5uQbmIL0+YmSv53wPTPi7oPzPvAvFmeRLfkeC5b5wnR
 cpGw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpN1+KBmJgNXyIC7xt3E7C+84flGu4R6kMxcIzz4ceZFxETxdSz2s87zAwGTZfCkvE39/DrQqwnS/4t@nongnu.org
X-Gm-Message-State: AFuF++mCzEQEf+m9uI/tkjMOis1ReFWGlu7rv3GhM5lvD/yHdIDJyqla
 tBMeQdpRHE9pHpco9kmWpyz1zVodw/incuKzti9i5mz0JNlu6VBso7TN+PNkaJDCjMTVtaxRgxz
 SRYryLd8yBxAwndlc43SY5zhcLZqhosY=
X-Gm-Gg: AR+sD12BFBaK+CXx9Ixbp3OD1TA8QLRfhcX6JQCSrFUE3qpciWb6ItiCyWXGCiS2y8S
 TN6zlXTWD8C/z8KynZWIpokypAPJh7DvorEEvNOEHXRBU5XHgKZYSRH7Nwzh8qLSV9HVqCtTejq
 RsiY5x87WiTTyBaXcD5o24T5uQYV8MMdIIlQHSgoNDk64/21xl35/9acWa+zMAwu6RhthCxJWKi
 v7aig5pGPRHcdWR+urQ08PBS9eME6NmvJ0sxZq1TLJIz+cek0wK46bkFyuNdJ2MZ+LntQQWOJns
 tpyCKnrNohwUK0Z/z1GM01roDY5dy6by5N6CiMMis6ISE/6BHBV5C5RDynFDV5M9vpwr1oHODQs
 3M8TIc2tj1F8PaV/M3LO0LgoZDVOoQ5faow5Xmr7RaBnfIZ47eE3OZDZuzWNJMocOTaRosaF9fV
 CPqrzQDafREeq476IZ
X-Received: by 2002:a05:6a21:4c06:b0:3b4:661d:8405 with SMTP id
 adf61e73a8af0-3d0f46c1e5cmr5905492637.4.1787810120898; Wed, 26 Aug 2026
 22:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260826214643.122728-5-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 15:25:06 +0930
X-Gm-Features: AcwNN1WU192jk-8SGck7g7Sk1u3NuCe_T416qjRd25zUPw8o5L2Lj_K7R7c79Jo
Message-ID: <CACPK8Xfizz2EBxq+iyTCRxUCEek-vXaMeCuN1nJACVeSky_g-g@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_riscv_iommu_sys()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42a.google.com
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
>  void *riscv_create_board_device_tree(const char *model, const char *compatible,
>                                       int *fdt_size)
> @@ -348,3 +350,41 @@ void riscv_create_fdt_syscon(void *fdt, uint32_t *phandle,
>      qemu_fdt_setprop_cell(fdt, name, "value", poweroff);
>      g_free(name);
>  }
> +
> +void riscv_create_fdt_riscv_iommu_sys(void *fdt, hwaddr addr, hwaddr size,
> +                                      uint32_t irq_chip,
> +                                      uint32_t msi_phandle,
> +                                      uint32_t *iommu_sys_phandle,
> +                                      uint32_t iommu_sys_irq)
> +{
> +    const char comp[] = "riscv,iommu";
> +    uint32_t iommu_phandle;
> +    g_autofree char *iommu_node = NULL;
> +    uint32_t iommu_irq_map[RISCV_IOMMU_INTR_COUNT] = {
> +        iommu_sys_irq + RISCV_IOMMU_INTR_CQ,
> +        iommu_sys_irq + RISCV_IOMMU_INTR_FQ,
> +        iommu_sys_irq + RISCV_IOMMU_INTR_PM,
> +        iommu_sys_irq + RISCV_IOMMU_INTR_PQ,
> +    };

Any reason to pack them into an array? Seems like they could be part
of the qemu_fdt_setprop_cells call:

qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
        iommu_sys_irq + RISCV_IOMMU_INTR_CQ, FDT_IRQ_TYPE_EDGE_LOW,
        iommu_sys_irq + RISCV_IOMMU_INTR_FQ, FDT_IRQ_TYPE_EDGE_LOW,
        iommu_sys_irq + RISCV_IOMMU_INTR_PM, FDT_IRQ_TYPE_EDGE_LOW,
        iommu_sys_irq + RISCV_IOMMU_INTR_PQ, FDT_IRQ_TYPE_EDGE_LOW);

> +
> +    iommu_node = g_strdup_printf("/soc/iommu@%"HWADDR_PRIx, addr);
> +    iommu_phandle = qemu_fdt_alloc_phandle(fdt);

Ohh, that's neat. Any reason we don't use this for all of phandle
allocation needs?

We should be consistent, so switch this one to the pattern used by the
rest of the file, or (preferably, IMO) switch them all over.

> +    qemu_fdt_add_subnode(fdt, iommu_node);
> +
> +    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
> +
> +    qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
> +
> +    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
> +        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
> +        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
> +        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
> +        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
> +
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
> +
> +    *iommu_sys_phandle = iommu_phandle;

Could we just return it? Or have it passed in, so we don't need to return it?

