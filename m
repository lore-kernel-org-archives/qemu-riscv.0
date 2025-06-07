Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F14C61CE8
	for <qemu-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 20:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uO04K-0006uT-0Y; Sat, 07 Jun 2025 16:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uO04I-0006u7-MR
 for qemu-riscv@nongnu.org; Sat, 07 Jun 2025 16:23:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uO04G-0004oa-QB
 for qemu-riscv@nongnu.org; Sat, 07 Jun 2025 16:23:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7424ccbef4eso2828127b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 07 Jun 2025 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749327783; x=1749932583; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wczXwPZF+Dth98BaigjlVITS4r/S+WORdPUCXau7N0M=;
 b=iyC2yoaFOINmWjJr+e0R9z/N6tFEHaPBI3GjHCfA6Te/MRLV3kNt6VAdojzTfqRl4S
 hZmFtdnzng07qUkK5+yPzOMPR0+EbcUKI2Sk9f+luVGQwDlyfjTIdOQtoDvXyFjWuROm
 7tYDZEx0P1gUUpdU1GJCN8mvHmfrNO2j4oyxNTeAL1qWyk7htJ2pVcKlcZFJ+uVNXjeh
 zppXu9A/I7GBGTaPU4KA+sJtyh4he8o5Cg5WlBlPUNhhDibaOKc43q/3x4gKI1UkNslP
 B6yZkfD+QAnkAcIJu5YXK2DLKNyRo+v4x2Hhed4h1mQGvrYBfK1Q19n9GKd5uXZ1lmsj
 sG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749327783; x=1749932583;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wczXwPZF+Dth98BaigjlVITS4r/S+WORdPUCXau7N0M=;
 b=CO6Pv0GKPvy+4q1kF4b1XV9/HsTl8fZFxqA2bxTXRS4+HareJyaTQ/NWw2+l6Crk9a
 dDQaI+7JjnbX78z0PJZPtUbdtoNH+pkbCXh/lHLo1RyELm+oOASo03S8TXZ217rIgBwt
 N238rMnhrEAPoRzXaxGLoZJBgyuFMlf9JnHzZBgV7wKpoyis6F3pYZW9JVzgBzHofFhe
 KDN2O3Kd289Orkv/+BXgOJEhM3fIAKlho/cW4UGAx2i8KBXvGjz7cVBZtUPKWKxZ1cdb
 FhKmvdLp15Y1kvzHaNoL9IXcuWigbfd6mo0jfIPBvYRxuAfBJXkAXin5UT5LFSMWv4r0
 +NVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKxKyIthllp6RZ5+x8fM/fe5rVlMMMtZ6R0jeJz3djpHDt7VO+XnjOKxBxkt0Yx5speK9/GJLmQQ3h@nongnu.org
X-Gm-Message-State: AOJu0Ywy2mty/9v9b36p4V3ijZ84zM9TNGt3YgSD70m/ejwxTbzhPQr/
 GWYt7iPMUto7KsVlOqisz5DziEKW7HY7FxrHPEdyNqdmqq5vmpop1Tbp6ohU1ZXl2WPFXKU9M2M
 yameq0Dw=
X-Gm-Gg: ASbGncsgwRaf/EvL6TwB0z+9S/VyxS/ZTNx+0OCofsIdNFfeEkn6ao/96XCao7eIGTa
 Z+x6UHBm4Vb3nFVmC1ZwZY6xEVyj3f+zPdwG0ULtkXhsuIqjAL7+1z5bxedUMAnhxQ3OLFYI8um
 46fAMA2vOm7pA7Bv3xJQSlPNEQgKh40HXgGGWwkRbVfoJ2gao+lmBfksvppiGtx9EOJKm24VE1b
 phZcI95Z0VMZSRGR/vshb5GnwZoGWGb8mhdCxHBC0dNNn62FeipXqg2pfKnrBWR/oQjyzTLCl/z
 xcFKiKLm+rHjhIGGY0XBUOyu28immT4UIdnegYiR1/zsIpWz2B1KAdQahOS4nmccsfaeNeEyZZY
 YAA==
X-Google-Smtp-Source: AGHT+IElMjCWPC3DhY2dJQ7a1twf8SPH+E2iOJcv68fEK8JWevSdRjh6Geb1YscpJISGsul3/7YTsg==
X-Received: by 2002:a05:6a00:4f8e:b0:747:ee09:1fdf with SMTP id
 d2e1a72fcca58-74827e50c52mr10678904b3a.4.1749327782772; 
 Sat, 07 Jun 2025 13:23:02 -0700 (PDT)
Received: from [192.168.68.110] ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0c7da0sm3198529b3a.139.2025.06.07.13.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jun 2025 13:23:02 -0700 (PDT)
Message-ID: <97fafc36-0d76-46b1-a74f-a109217cb287@ventanamicro.com>
Date: Sat, 7 Jun 2025 17:22:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add initial CVA6 implementaiton
To: Ben Dooks <ben.dooks@codethink.co.uk>, nazar.kazakov@codethink.co.uk,
 joseph.baker@codethink.co.uk, fran.redondo@codethink.co.uk,
 lawrence.hunter@codethink.co.uk, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250527112437.291445-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250527112437.291445-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

(added Alistair in CC)

I suggest adding the RISC-V maintainer, Alistair, in the CC for the next
posting. It helps in the series visibility.

It would also be nice to add a RISC-V reference in the subject, e.g.
"RISCV: Add initial CVA6 implementation", to help ppl from the common
qemu-devel ML to quickly identify what the series is about.



Thanks,

Daniel

On 5/27/25 8:24 AM, Ben Dooks wrote:
> This implements the CVA6 (the corev_apu from the fpga) model.
> 
> v2:
> - fixed whitespace and rebased patches
> 
> 


