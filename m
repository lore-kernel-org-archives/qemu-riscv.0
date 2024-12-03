Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FDCD4979A
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 10:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIPgx-0007CV-Dc; Tue, 03 Dec 2024 04:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPgu-0007Bt-Rq
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 04:59:36 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPgm-0006t3-P5
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 04:59:31 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385ea29eee1so1846882f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 01:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733219967; x=1733824767; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jn71q+BYmRY3Un6hrVzIXXO71Ml4MawXlVXT1Vh5wTI=;
 b=u9W988u6QaZxwYYX05nB0h0RRm/SnIBD4QE+WMGRiknoSFO3oIDv1YFeBZDiC9xVGW
 vVWeMxpTuw2S1EvIBIJkLfa6ufkIC74taASOLtXUzPasnLVMF78uNGS8+Z6NpHxXpeOl
 TQ1SqqyReGmGIGOwezoFhAEeQKhastk9Niuwz1T8U68nFxWJ/d55YXtBWTroK4NYEggf
 bWf9vFTbCoHYPw2o0RbxsThXGS//oRr2n0u5JK9p+vHvmytmGY4rFHegHNSG/t5uzYzi
 N6aIlhY2cuNMyFsKu24smWKjSKNPq+dipxaP/n15BogCwwzMIhXMpo5g32uwaXp7qGh0
 eyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733219967; x=1733824767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jn71q+BYmRY3Un6hrVzIXXO71Ml4MawXlVXT1Vh5wTI=;
 b=qHRVuEYjbxwhau9LsF53zse3AU5ltDwu1qG5H5++zf6K5mzsecLV+QG/TNCpl2ZqaS
 5PXjve0D94UtsdLT5x7WuSmuVHVZSZ2fdNC6DwjEfejg7vDkR5YuykqfIJ/73MaajfxR
 qVClfrZW0tpRq801DZESsZPqxGz8eI8f2Ledg+nVJKTx0VqDTQvicLNs+8vUnvqGjU6o
 iBforRidnLEdpVC7B7rTlahT3MBgu/kWpAae952ZWPmvXV1mAOdbWr4s+FECaM6X15CT
 Wp+dCN8WmvWQcbXf5RmrHdIqQEos1ZOqBNGUALPlgmLEaFbiOyURz2dzqEz6Oxv+YlCL
 jYIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrTRaxB0at26CeSfiHYGamkGmMMdxyNuGvnae2MRsa+Dyx3A7/0yjUcrU0uJAvNV1hbyq+yth63zX4@nongnu.org
X-Gm-Message-State: AOJu0Yxk8LWqdGEWxh7Au24gPFufyflWH6QYCtTzRl5fw/wakh2BSDzQ
 RtvmJOnQgKa2Y6ohYHKIfUIqsMJRVjvgvwKXRVXP8XTn1HCUOlJ6bdV/MaNgOSY=
X-Gm-Gg: ASbGnctz12EW5xkgurZp/MJqCaY9CBDlBDlEvkdfhMaIWZkPRxPLEGbWs+HRpYppMWO
 pdU/lgBzJOeJe+6nX76+FrFsii6sR9JeLUmHhbekvJkr4LZcgSqVEjHnNXBx2SbPLz/FlKdBdmJ
 C4wsumhL9O7diXd5RF6QSF5MPmIerN2vytTQqKI5nJyiKHoZt7oeSPUQ2z/qHlemjjGupmWC0O1
 s+n9Zi4ufndMNkIcOG+UTesS+dBBx44bWjDHJA+/DNarTKyFOH0eNFEAGML2Nb3Vw==
X-Google-Smtp-Source: AGHT+IGihepYzmjeq6nk4ZmcjGTDlGqlZVonMtA8Ntv9cpeSveskm+Grswfj/AbJFEcgR6GiW44zdw==
X-Received: by 2002:a05:6000:1446:b0:385:f092:e16 with SMTP id
 ffacd0b85a97d-385fd54df09mr1393301f8f.55.1733219966725; 
 Tue, 03 Dec 2024 01:59:26 -0800 (PST)
Received: from [192.168.69.223] ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e0d4778dsm11412369f8f.45.2024.12.03.01.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:59:26 -0800 (PST)
Message-ID: <cb079b65-e5fc-4667-aa63-9ff347666b6e@linaro.org>
Date: Tue, 3 Dec 2024 10:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binfmt: Don't consider riscv{32,64} part of the same
 family
To: Andrea Bolognani <abologna@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv <qemu-riscv@nongnu.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 David Abdurachmanov <davidlt@rivosinc.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Corbin <mark@dibsco.co.uk>
References: <20241203094702.124748-1-abologna@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241203094702.124748-1-abologna@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Hi Andrea,

On 3/12/24 10:47, Andrea Bolognani wrote:
> Currently the script won't generate a configuration file that
> sets up qemu-user-riscv32 on riscv64, likely under the
> assumption that 64-bit RISC-V machines can natively run 32-bit

I'm confused by the "machines" description used for user emulation.

> RISC-V code.
> 
> However this functionality, while theoretically possible, in
> practice is missing from most commonly available RISC-V hardware
> and not enabled at the distro level. So qemu-user-riscv32 really
> is the only option to run riscv32 binaries on riscv64.

We have definitions such ELF_ARCH/ELF_PLATFORM/ELF_MACHINE to
parse ELF header and select the best CPU / flags. Maybe RISC-V
lacks them?

BTW we should expose that for linux-user as target_arch_elf.h,
like bsd-user does, that would reduce all these #ifdef'ry in
linux-user/elfload.c...

> 
> Make riscv32 and riscv64 each its own family, so that the
> configuration file we need to make 32-on-64 userspace emulation
> work gets generated.

Does this patch aim for 9.2? Otherwise FYI  I'm working on unifying
32/64-bit targets, maybe for 10.0...

> 
> Link: https://src.fedoraproject.org/rpms/qemu/pull-request/72
> Thanks: David Abdurachmanov <davidlt@rivosinc.com>
> Thanks: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> ---
>   scripts/qemu-binfmt-conf.sh | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 6ef9f118d9..e38b767c24 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -110,11 +110,11 @@ hppa_family=hppa
>   
>   riscv32_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00'
>   riscv32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> -riscv32_family=riscv
> +riscv32_family=riscv32
>   
>   riscv64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00'
>   riscv64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> -riscv64_family=riscv
> +riscv64_family=riscv64
>   
>   xtensa_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x5e\x00'
>   xtensa_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> @@ -168,9 +168,6 @@ qemu_get_family() {
>       sparc*)
>           echo "sparc"
>           ;;
> -    riscv*)
> -        echo "riscv"
> -        ;;
>       loongarch*)
>           echo "loongarch"
>           ;;


