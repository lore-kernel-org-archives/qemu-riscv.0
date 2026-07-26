Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A6C531CC
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 05:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnrpP-0005Cm-L1; Sun, 26 Jul 2026 01:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnrpO-0005CT-SJ
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 01:55:10 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnrpN-0000VI-Bm
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 01:55:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c8612812170so223153a12.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 22:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785045308; x=1785650108; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xUM5ZXHD/oLWvFDoO+hHlLuSDfgeblRNtAYDQvQBs2Q=;
 b=sgov9Tjv9Yj6zjeTZu0VLlIow6chFznAFOdob0xo0F8Pytj/FZ9Ipp57+/DrKLr21D
 83+rwPKizxLEnd6ygj33d0K4YcbxtOReDWn8bsk6a/FPbbUmo/3NUF/+MaXK1LBtPG3l
 RDQDbfaj7za7hjmZmZdrAcZqfzop2xbXOMAbL5sePl7hfFWtX10XkfovMqFdtaBfDZhI
 eNRpmoAn/m6q+IccDIeX92VSDfFIdooYDg44XM9n9MjbSjHFCoL9nearmExni9zc5kaC
 UExagu5DPHtZW1UD7GNwAw1+ohqZKXbDt0z5GqAhKpF9StJ2Cg9tYUDSklOIyqLTNfSc
 EUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785045308; x=1785650108;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xUM5ZXHD/oLWvFDoO+hHlLuSDfgeblRNtAYDQvQBs2Q=;
 b=m8HqAgTjWbczleFXcX2HjYMicDNwjp8WuVP+BStrxGAT+ufZQRr57h851OGLS4c2Ru
 9xdeBmgIKvGyULZ2cc+r2amsWRlioSpPujwEhEjPb+3roN5lHkL0cf4MmHNYoAKTQrcr
 rQD0RSL+pTLt1+AC3jkv/gsr9AKGLAmiBoupO8M3XHCvchs1sRwvhjHKjuhHW/wLuC+L
 oeV6ojT5d/MnuSY6GgDW4sppSGmcuI7JqjMFjdnAHxYabXGNriErPWGSwqXunrT5xybk
 1y5NCFaCgoq4TUW6OXmHyQrm2QBHO4ZVJB2FnhqqsscB3bldD4vbgy/9VHbO4psWANBP
 Nkmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpSNOvtVQvKDFQKM1G7aN8xZeJlcfamPRJVxmwTYS2z+rvloWYg67Gbx6SQBnIcOZZ3R0jU/ZK0Uknb@nongnu.org
X-Gm-Message-State: AOJu0YwshNawRo+DREJ9qSDh1+gT/8rio1QfCG0yj+cZXiQkPJCL/aQZ
 MzlXVWSG8bxmDbo5OXCh1lunWrhoal2Km5JCSkMRv/b/w0DUCXM6qWenx5kz/Wpky6Q=
X-Gm-Gg: AR+sD124Od9cTeF4Dn821QMaTB2Cy0W5KStCsLSZHsM98s+0BDVo3Yj1FX096vgoPke
 BPG3buoacER9mWNvZ91lXXjboZRX+sJM7fcLhdS0K6z619YxcykRu2m7x0xweypBcARzSaU+Rrd
 63hNwz3z6TENU88a0HMdiH+lcHzFq+1VIz4lp0vUpjOtvWO+pbVmQKfEXLgfJclJiHIZseja+hf
 b03IiXnYDW8IOpphtExdnoiaIWw8lvr/6Hq53FWK8YOROcK5dHcDXFtoM2EZ0VUZJ5E/f5gVmoN
 R++8NYrHiUnoCiC7ANncKkJZwYsErWyaxjNjouBjhk5a37aUJ/Q2jQyJMgf6kDYudkoLolNX6Ml
 kGz8BbDcks7SRTecWWkEpEzaeeZy+isT4P5G/7F+cWDrVzuPjGaaZzgzfEdQ+fEvupuIka2s+Hk
 I0KjJHBGXJ6uRnV/ZMZH3b1R2KfRNaaQo=
X-Received: by 2002:a17:903:1843:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2cfde792b83mr33341805ad.2.1785045307775; 
 Sat, 25 Jul 2026 22:55:07 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc447f6bsm19200010eec.12.2026.07.25.22.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 22:55:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/7] tests/qtest: add test for K230 gsdma
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-4-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-4-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 13:54:57 +0800
Message-Id: <178504529704.906524.5128555664916138089.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045302; l=848;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=7MpjXv6qCPx3zXPy801wbS7gVS/EmtI8CjqujWNQ8dE=;
 b=IDNd01fXNgki4OaXfz0inGNKABsxmcRzS+rWwxc5ClbiPA5jmN4gBKwSo2j0e1Ip8js8zvmVU
 DxOqd0kPPR2DTicKxWVyWWwjuLfu3rh2zkEFERGpLnM4b0DAxj+/tB8
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=caojunze424@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, 22 Jul 2026 00:13:31 +0800, Tao Ding <dingtao0430@163.com> wrote:
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 56ff860e21..1b13a777c9 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -297,7 +297,7 @@ qtests_riscv64 = ['riscv-csr-test'] + \
>    (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') and
>     config_all_devices.has_key('CONFIG_RISCV_IOMMU') ?
>     ['iommu-riscv-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test'] : [])
> +  (config_all_devices.has_key('CONFIG_K230') ? ['k230-wdt-test', 'k230-gsdma-test'] : [])
>  
>  qtests_hexagon = ['boot-serial-test']
>  

The new source files haven't been added to the MAINTAINERS.
Please update.
Other than that, there are no issues.

-- 
Junze Cao <caojunze424@gmail.com>


