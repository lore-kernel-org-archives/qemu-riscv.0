Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151D0C531F9
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 07:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wntY2-0004gw-I2; Sun, 26 Jul 2026 03:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wntXp-0004aU-Lf
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 03:45:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wntXn-0004ob-C0
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 03:45:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cad85b7b5aso2653765ad.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785051906; x=1785656706; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5zepJt2tXsansCFxMv8tU8qJmMzWfPWX4SjXZhlCkpc=;
 b=iCJIvjTlSyTyfM3B9+ebmazr7VYTRxGHBmPNDjqIacSid3MaXerSwgSn0LWmP3sfKC
 dm+VRQr4m6eLGPmVzKdPQVfoCACZ3k5ZkVqZqm1avJ8A7ZiA7H+b+3dwHD9CsbX3YDAT
 GV93RkBIvo8ywr32gEJ2wcS8msX4SUyFnYHS+hemx7lQ7UQCHlwVs2OijgkUXPHTThzy
 Y9I4bpv/u/6Nfcv765Mk4UUlBJPz/xQv72lX/2R1xoe55UfE2ms8MSx8HqojPx8cEMAV
 YxqN8awzwrWGI5eZyzQZW8HAV4vZ3aI6uYMmLWaVa7nBP5c2p0lWiX0r5bNdabZ1ZK65
 qzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785051906; x=1785656706;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5zepJt2tXsansCFxMv8tU8qJmMzWfPWX4SjXZhlCkpc=;
 b=c85E6G/nye/ihtDvCa6VDChhYwIFRTWanyP8rhWn66vrYFqVqvd6jyUBSeMVXobnKu
 K9hnAbT/ACXSN/as018zAZZ+wy46TjrtcBjoz2Fz8Na+sicV0UiPKsqdPJj1VKOQmxaR
 TpX9t9pNjAwoJJVZImE303nUSi1dmcbwXejYcNlQ/NeJu0Q0XMvTQbviGH//Wg/rrAB3
 DIeN8qv5NNqsTI/jLX+8sC679VBr+Idf2dAOTkFN/6CQac3EYW/L8vOd+pJhQoMOM5N/
 9XISu1i30AUOqSBu8+X8wyUMpAKNIhCxsVkeTF4DsMagu8pIu7pRTobObBCx92e4mbPe
 sOjg==
X-Forwarded-Encrypted: i=1;
 AHgh+RryqZ2Y63Yame9uYOHfBtRk/yItEYZg15Tc8BtpaVG2txkfd4mZI0K3SeHCFaw9JwhDoWocQDzLtQSg@nongnu.org
X-Gm-Message-State: AOJu0Yz5r5V1TYAkNRcImotx/mr/3cY0yX8/j6FNkvNowug/FIKc7ykz
 GpRfZgidSaOXC2a+tlvnnWP/bn5OP6bOfXKKZuxaBNC1tYe0KN3D8yEn
X-Gm-Gg: AR+sD13o1EZOrKaPMvf74mqd3Rm7sv6L51XckCnV6wrI+PCVfnDWRU4LrWLjKyOqV3B
 cAaROHHzw94h8evVMFDhxT6YExteJ6uVWbAEw9zg+79RzkVhFgQzZiBnWr0/uM1RMK/LlAfE//L
 dzoRKzWzwNKSuyXqrIK73oKDCwlAe59hCM3Rp1oViFc6gRZPs7yMNIr7KhHEuiEwC85HJbQRI19
 Ud2Xyus0Jz91pgXjBSTfViq2N9rpkZjo9h+b9ZrLhpQW8XGvHuU2/l22Ccz6k6yhbrhX2zx2WvD
 hijGwuOaIlJkYkl62ki7TqN7Il8ub7d7k116eY8zMQyVeVtni+xFFVZGUPvo32LptitCxWn1swf
 AiLOs2K0tz5/LDRLEqxbAOyD3oeLcRt9A1xu1ijDhYqRe+qKVNnKjw4qJC6NO24lDm8dNebPMeI
 huM9cGM/PM98Qx2u2V4ba8
X-Received: by 2002:a17:903:1aae:b0:2cc:e7f3:d39e with SMTP id
 d9443c01a7336-2cfde683892mr57972455ad.2.1785051905825; 
 Sun, 26 Jul 2026 00:45:05 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc3e1255sm28155188eec.4.2026.07.26.00.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 00:45:05 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 7/7] hw/riscv: k230: add a noc stub region in K230
 board
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-8-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-8-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 15:44:59 +0800
Message-Id: <178505189962.940286.11302517412616157706.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785051903; l=930;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=5ozCAA3hwnEZgPYB8rIc6gXwM3rj8BzGJd/eFkWsWtI=;
 b=s41npXniTFpEGGMGsj+BVu5ZCcZkQgvUZLjkgj9zAhqLaG7TDlhHQ5wjtEipGpQJJT/HgjqLI
 f9h6WGzvByeDrdMkkZExQeuxh9i3rCDCLMlA/mbvJsYBdTK2MbHUXzR
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=caojunze424@gmail.com; helo=mail-pl1-x633.google.com
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

On Wed, 22 Jul 2026 00:13:35 +0800, Tao Ding <dingtao0430@163.com> wrote:
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 7fd1ec4c25..ff834d6724 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -234,6 +234,9 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>                                qdev_get_gpio_in(DEVICE(&s->decomp_gzip), i));
>      }
>  
> +    /* Noc stub, the k230 decomp_gzip driver in uboot will access this region */
> +    create_unimplemented_device("noc-stub", 0x91302000, 0x1000);
> +
>      /* unimplemented devices */
>      create_unimplemented_device("kpu.l2-cache",
>                                  memmap[K230_DEV_KPU_L2_CACHE].base,

Please disregard the Reviewed-by tag in my previous reply; it used an
obsolete identity. The review itself is unchanged.

Reviewed-by: Junze Cao <caojunze424@gmail.com>

-- 
Junze Cao <caojunze424@gmail.com>


