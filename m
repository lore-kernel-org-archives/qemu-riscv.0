Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD1KH-0005X0-MF
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 03:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1KE-0005Tf-Ni
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD1KD-00036r-GO
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:14 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55859)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD1KD-00034s-BW
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:35:13 -0400
Received: by mail-pj1-x1044.google.com with SMTP id mj6so5174510pjb.5
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 00:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5d8VkS4eh1KZi+aDGZL6CCq5Tshn3BSLrfHk0kCZtGM=;
 b=VBeDYo0cjG4WvDYhzrLiR4QPHAkS/R2UavCde72N9+nVs9VrSbtyxMlxD2s7VE7vAm
 iYxMLSGrz2VYqqV98RBGc90LarFk4VjgeYlQL876DploH1ux1CP1Sb0VkDKgwFzt4XMZ
 H0CmJVSlBQIsEAotPBvWwvgI2xW9SJw0js1Iav7cnj8WmCx/5RE7DGlsHM6COGXyN0LV
 Pebevavae2nDoWi7eLKw0CmKFTSdsU6cTBYJdOvoJ3pe+ygyA/Mc5/hyWMMA8DtVGcaV
 S5n3mxLti1AwLoLn3tPpdztDBLzU+qm7SUV6SHMyeuKp8QydRoHDiIhB+6XpaHfdrgpN
 2VfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5d8VkS4eh1KZi+aDGZL6CCq5Tshn3BSLrfHk0kCZtGM=;
 b=dwx0Dz+DKe+AAo8XcXoxXKOj2d2xywiyflNfh3BdOg8BVfRjozfJP9WD3MoKejGeW8
 1cDZojXLg1wYRFNNxumhu4xlaOfK/zxU7Ackyh/RXiTFyfuMUuwUzn64mQyQSLoqUbJN
 x1El7AoNW5yrdytXqMSrHIoGtzwQMpYMajaqyho8IoI5wyFB5y3xG6sSzs4NtpjyquQO
 yb3NuXtfUcTAZRQWF9u6NAUBbHbmSn5otBJi3kmjv9i9Zp8q0K7NjXh1i2pDtOH9ypnI
 sOH/4AD5MKedIizqrm2BW8OHE8d+Yp+Gh1TecpDxnluX6ioxe72g111HwpA3BQlzo874
 DYHQ==
X-Gm-Message-State: ANhLgQ2NeAgogiXoLi0AaxlJq3ewrrVNBxJd4p2ygm7YemsszKRM0cFh
 1rBioNxxt3cmwW3M2QsciUEQYPPnE0U=
X-Google-Smtp-Source: ADFU+vuuvC69TfCVCDJxRTiitMET2Oq5ZPonL3OeZO+Salub/yc9e9LJabu2YtzbFoWLB148zmbJ3Q==
X-Received: by 2002:a17:902:8b8a:: with SMTP id
 ay10mr17215854plb.288.1584171312172; 
 Sat, 14 Mar 2020 00:35:12 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ck11sm596568pjb.32.2020.03.14.00.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 00:35:11 -0700 (PDT)
Subject: Re: [PATCH v5 21/60] target/riscv: vector widening integer
 multiply-add instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-22-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a150d6f5-32c8-45f8-c4d8-38f9ca5ccc7b@linaro.org>
Date: Sat, 14 Mar 2020 00:13:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-22-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Sat, 14 Mar 2020 07:35:15 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 22 ++++++++++++
>  target/riscv/insn32.decode              |  7 ++++
>  target/riscv/insn_trans/trans_rvv.inc.c |  9 +++++
>  target/riscv/vector_helper.c            | 45 +++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

