Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911B9CCD183
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 16:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8LEQ-0001bu-EO; Mon, 13 Oct 2025 12:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8LE2-0001ai-Fz
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 12:16:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8LDz-0003fE-RB
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 12:16:42 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3305c08d9f6so3568216a91.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760372196; x=1760976996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9dZy99F3XbHoMbsjvVjG5DZIQxjYvKcEwYXiFA5K6Mo=;
 b=Yh8jHDMI5GqwKYD9Tv4NsDNkYvnn0DhMYt6Wrc81O4vFyX/yaj2L3uQ9VpECnWzlQs
 zM5wJBAM4sP0dbVg0KhuSUNhuwPXQXr6lRRTfi62Ku3B+5Km2DGju3TMqNTgNAmZQBJn
 yKEv4Ge/gKRf0lUzg5RwdP4n/Sn1IsFDeFzKCF/0IsRQUYoHPps3PCRl8+S1qiSEZtWd
 ZDPFG5usiyCrpPC06LR6Y0NLuJMnOSQsXcFVmu/FK7C5pnJDIvAp4wWQxZairLVR9B+r
 IHOY83/w1hc/rCi3EIuLrHFkdIbV4htyeefenRrq0W2JuBtTsdHjtOM/tm8I7K645zIr
 hJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760372196; x=1760976996;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9dZy99F3XbHoMbsjvVjG5DZIQxjYvKcEwYXiFA5K6Mo=;
 b=dNO/VhGImUYBwJTMtTyuOlkuKiQDqO3oW69uu4PnOhI4iae5t4j4PzefaE3VdfcBJh
 JdbAv2hkgZ3bcuy2Gul3mFFNu4bUCKuQfwBIFmdCku/R+sSBYYsIIuzOwKup1gv7PRmV
 5x+HP1OIRMoTYZvNBlBX1wYPa15oDWQCyzOxjoOhZLYo+T9Uzid61X/Ym1s5RMXP1Gtv
 Dw69ibsCFVJ50R9Knpbcv6vjJJ4EIImQ8rSp3Wq0gxA+Lxg/gnl7ISmJbm9qPuUCuVST
 rVk+5NT7K0x/BEWKTbObQtQGzon6uBX+vK2Q31oF9us2AI5rMe2aHmlF2vZeU+cDx75W
 eV+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdP65vaKP+OsnarfI4o1lbC7bh6jSEQv/nrHxhNSYSPC8pdf73DKTELcT6x7EQ+qeq6w/YhdPup2k0@nongnu.org
X-Gm-Message-State: AOJu0YymZF450qdzoZyiRa1Us1Ju66fN5iDp8c0WIRjN7G1Qys6ZXGVW
 3vhcSPhKEedSJbVxb9tYCzV/UkOL2O4SDIQEdm3h7vLWOiXRhw9X0kKtBmJmFhL/k2I=
X-Gm-Gg: ASbGncuas1VuE87j+O/KxeRNW2oRcVuv8hIXDuKmEN7u/m2HTTk6+SgNOrW43XR47NV
 enoLW2NaZFhOdl/PqdDO5B4UBrnnKv/76O93ELl/X1NJ60bdtIoJuHtLxeAnKO5cpHa+DIooK0Q
 Ky/lTTiiiZFuZ207mW/kWEKrW0y95QE216FChuEpLljCoeFQE7dGiUSPUrRlwjDMlwPxXEslL1u
 MDYdG311VUWhTe5qJc62pWaDDPkgNJ/X1cEObyKBxPRGe9kXw+eFIEl2efq+qNcaTKRomYx2WW2
 2mjNpUP00RtRra0UfdU7m4a2WNksvP+WKbWyMOciitSY2z6RZJD42WyH5WQDA5TwCWnx8rksMMN
 VQAwOcTXPMy4b0cBRKDLS/t/TAnzFmGDKhKyDL8r4EhrjxCCIchcG1v1v
X-Google-Smtp-Source: AGHT+IGIQOP+sSZTRNKQa9mzZPqTFtaWMGEgHnKQ44+L3lH8dEchvF4A/4ZGrUoIE5Is57Kzn4SMEA==
X-Received: by 2002:a17:90b:164b:b0:32e:3592:581a with SMTP id
 98e67ed59e1d1-33b51734ce5mr29355866a91.17.1760372196174; 
 Mon, 13 Oct 2025 09:16:36 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b626e8f80sm12599059a91.22.2025.10.13.09.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 09:16:35 -0700 (PDT)
Message-ID: <64b0434a-d0f2-457b-9301-968239dfe504@ventanamicro.com>
Date: Mon, 13 Oct 2025 13:16:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: Correct mmu-type property of sifive_u harts in
 device tree
To: Zejun Zhao <jelly.zhao.42@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>
References: <cca1b0f7-8063-4d53-88f7-a56eb56b3eca@ventanamicro.com>
 <20251013154340.1989427-1-jelly.zhao.42@gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251013154340.1989427-1-jelly.zhao.42@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 10/13/25 12:43 PM, Zejun Zhao wrote:
> On Mon, 13 Oct 2025 11:38:48 -0300, Daniel wrote:
>> But the documentation I found [1] seems to indicate that it should
>> support sv48.
> 
> The second paragraph after the referenced Table 9 from [1] states:
>> For RV64 architectures on SiFive designs,satp.MODE=8 is used for Sv39
>> virtual addressing, and no other modes are currently supported.
> 
> And here is the same statement from [1]:
>> The U5 has support for virtual memory through the use of a Memory
>> Management Unit (MMU). The MMU supports the Bare and Sv39 modes as
>> described inThe RISC‑V Instruction Set Man-ual, Volume II: Privileged
>> Architecture, Version 1.10.
> 
> So I believe we should not try to support Sv48 for this hart. Hardcoding
> it to Sv39 should be fine and correct.


Makes sense. I believe we can proceed with the changes then.


Thanks,

Daniel


> 
> Regards,
> 
> Zejun
> 
> [1] https://starfivetech.com/uploads/u54_core_complex_manual_21G1.pdf


