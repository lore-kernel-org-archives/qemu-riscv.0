Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRKvI-0004el-0v
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 15:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRKvF-0004cu-NP
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 15:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jRKvF-0005mU-0m
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 15:20:37 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jRKvE-0005ly-IJ
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 15:20:36 -0400
Received: by mail-pj1-x1041.google.com with SMTP id fu13so815004pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Apr 2020 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Daf79OsgPMnuEEVxBEtjek7ejgbQ2cP8bZVNkScey1M=;
 b=bDq13WTrecaE1WOgYZ7SqTUUGgr/JyuaM3J/cggxWZj6UasqcZjy7xOXR0pWvgeK/3
 +FJjuABPYyO5Qi+/hM37uG7rZBdRTgc0qrVXPsVjGdiziPQ7wPnzyQcld4QGRxewOJ87
 LQvcPjVwuYHL8I7YLgX0G6KwxenCWhaYQumDTZTmHAKNcNKApkZoSdE41B8WSAxfyo0Z
 sYjiEdZ9B5IbtvQuQVzwKrifadOQrIBw79ZQfMrTu2vp3pkHfiAv+zqtnSM5LirlY2R0
 Qa02IPJrYo9LaGNEp79EMjQh5pqlLLP1BM/1Vnlohwuwn+GoqTAabSQfnsFbfVKEPUJX
 d2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Daf79OsgPMnuEEVxBEtjek7ejgbQ2cP8bZVNkScey1M=;
 b=M/lgED+myMM5iuGf8S3vid31/mblZbbRoDP4WSpFNv1K2bzDH44jqjnYIbHX4Bep/p
 tJOv0g9Z4uA3dHLV8fXulGHyBny01VtOsZTr/jtYY8uMNsRHiROvtctPGoLJ1PIxcfkl
 hnjWskQu58GjzKZahrBMXJ1sIaxRg44B6WsHyF5GyWNYbQef+doSzBFJcvkP3CVCHsCW
 KzCfS8kEx0+ZwO9v85zbzeI71VnkSEBRizotzjsKZWgZqgGhBp/JI+qKrzMLJyVmfIeq
 ffcfyAS7G2Jl6m7izWw1UqZ35G8l6XOVSTKHx74I+T9iuNZxkP8/iois/Kh5NaFC9pUt
 //WA==
X-Gm-Message-State: AGi0Pubw56plz7mNbXXdDK1izYdW1dPEBYFt0IMHog44c8Wx1l01vHQy
 4eQgsebL3971I7PWh2/7y2/+Ig==
X-Google-Smtp-Source: APiQypIb/MLZSY6elOdP17qGFJH0oKZRQXsBmTX22PKKFTUDDsrIEvIVCoDW2iYteZwQMrkxjz4PNA==
X-Received: by 2002:a17:90a:20a8:: with SMTP id
 f37mr280448pjg.148.1587583234472; 
 Wed, 22 Apr 2020 12:20:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i185sm261785pfg.14.2020.04.22.12.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 12:20:33 -0700 (PDT)
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Laurent Vivier <laurent@vivier.eu>,
 Riku Voipio <riku.voipio@iki.fi>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
 <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
 <CAKmqyKMZ9x+PXOxnFqE5e-h+cCZjJThEBjJip_OCppjX71DSrg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e65178b8-32b0-b389-c58a-6883b9bc0989@linaro.org>
Date: Wed, 22 Apr 2020 12:20:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMZ9x+PXOxnFqE5e-h+cCZjJThEBjJip_OCppjX71DSrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Apr 2020 19:20:38 -0000

On 4/22/20 11:05 AM, Alistair Francis wrote:
> Just to clarify, this patch is still correct right?

Yes.


r~

