Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BDC87FDB
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 13:38:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulSj7-0000Md-LF; Mon, 11 Aug 2025 09:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSj3-00008U-5s
 for qemu-riscv@nongnu.org; Mon, 11 Aug 2025 09:38:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulSiz-0005xx-74
 for qemu-riscv@nongnu.org; Mon, 11 Aug 2025 09:38:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso27642365e9.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Aug 2025 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754919481; x=1755524281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9QyDmOD3c7gJoYxpeNy2D55L6583VGCZiRZgC+aA3M=;
 b=eN5PxInx6aG8d1FSCqrjWMmjc3FAunpaVHqZyQSARBlXbjXK3xntrSfcOorK9Q7/EB
 EineE16iByMUG9+ax3ZT6YKQ2Kj16s9K2r8x1YQniWpwIAxdpRV5q5+TtgfQm0thaDCX
 el3tktHDptzHrlX/diN8asHKBylLPdnK8lTOAzpywJHzo+iiyTav6J/c83Q7PLeOVq+f
 ZSTni4iVX/TyflaKLPgrrQcPQlCUWGFFJfMQwqOx2Xj0nLCk1hFITWsJIz0b5B8Utr73
 qFKFNLUyEeluTeDfb8bNVPxUFis06JyJ708kYxcD/ZWqTjmiIXwBlHynxhMjrWGDsxxF
 B6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754919481; x=1755524281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9QyDmOD3c7gJoYxpeNy2D55L6583VGCZiRZgC+aA3M=;
 b=nVzrzZxWjrq3Ug8k4bzACNFET7x/gNsuIJpGSzpVbn09+rXU8nJ+0yVinITQPFUcAx
 R4nV14xL+Wiu2Rcu5P1cxrvQXLgFkxPdhLnr7XE5yrJN5PFCum7/v9UNkxg5bQuPPK15
 WrIqDicgEe72HwqGuIpL5HvIZak//CoDaqwdG7XFTxmo7COsXqvtdGbk9J+kS8T8gE7q
 d9JJ2xfLKVVpfMDhyyu2Lo6M6uRy9/P4RPxTLcYRHsDTXnelE7oX9gxHDbgnV+yMtNbR
 X19HWDfCUwEyQwGrhScMzA+7TTbgkjF8rRRPCWx6TwYy1Fl9WBF2Lbxbtb972Q+m6LY8
 ZmTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvL05QrlD08XyZRBRuz4BOmr32f+mKzvoVo9Wl8WO0SkfjRtMa7n6+Aw7EFi9xQdTa5qmzuU0VOzXP@nongnu.org
X-Gm-Message-State: AOJu0YzszL5eDD/XVbHCysMVR7j4exbqdJHJJvMtbqx8qQYDSpegC7Yd
 4vL8rHOVi/SYAQ2qIXRA+qw72wQWjWnxA8e1Z0UdGsR9mmR06xtG75pfnTt0+mUuzfQ=
X-Gm-Gg: ASbGncsh+o82+oKGOMw6RW0Nme0rRg6BT7pa3w3/WW0EvChJru3iPeZZjKk6ecAW/X0
 Y2nz7VxLeixCmPCjqqCinUb4XqRJztel8AHOkqRfpCGnQWR6mc5EfMCRAOlxeNe3laK1V0azj1a
 preGfuwBWMbOQfbQ5LAE3WeCaLAn3SLFqvyqx2wuF5erT9cwDTaC0a0FKQ2mHyd3Mfk4sBfvD/v
 n0MIExuccJu9FHoCxY8FBKL3odZxnawWzpIaxkt+NGgLvy3kNSIc5Dktclkv913563vNiGf+Pdr
 y1OkREaLtTAefeqE2lFylp2E60mP+2a97csz7RJzz6+Ri9dIC26uPgGcNxvRfbyW0JsSNbD82YA
 /QFrBsvzT+Pwzir4EhfS5XqX81SHtmFpRih7KWwIkrbumDRQfoqkD0x4Dslhezz5slGGFdz0=
X-Google-Smtp-Source: AGHT+IFFsCdbSe+a4IDaI9gkPILHsi2007VwgyPQmoGnqPA/wd7/l4pc63ukIbi/FWeaOH/WO5yQog==
X-Received: by 2002:a05:6000:2388:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3b900b2de7bmr8953367f8f.16.1754919481284; 
 Mon, 11 Aug 2025 06:38:01 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48de68sm40960295f8f.67.2025.08.11.06.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:38:00 -0700 (PDT)
Message-ID: <b76d242e-d18f-4ec9-b436-11d8d8c09ebb@linaro.org>
Date: Mon, 11 Aug 2025 15:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/uefi: open json file in binary mode
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
References: <20250811130110.820958-1-kraxel@redhat.com>
 <20250811130110.820958-4-kraxel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250811130110.820958-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 11/8/25 15:01, Gerd Hoffmann wrote:
> Fixes file length discrepancies due to line ending conversions
> on windows hosts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3058
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/uefi/var-service-json.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


