Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irO8b-00065x-5n
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 10:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irO8Y-00060J-9x
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irO8X-0007Rl-48
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:29:46 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irO8W-0007Qc-TF
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 10:29:45 -0500
Received: by mail-pj1-x102f.google.com with SMTP id u63so1000118pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 07:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oNmpSnLQPm63kl684uWiRSWlihMm4iv5IcyfVncHJDo=;
 b=kDp31X4HuEWgRZs4P5B2eHxIq+iJ4opMYM0WUrZ7N2MV3t65S7J2XOPLI1a4tLFv7X
 n0HpMob7H9VxsCCfzIEgvqfUOG28kQjhg6/r0M49wt10dI1lnp/4cxh7E6mSH+p1DU3g
 jLFPu8axyyFpWg6B0s2cTUVUg1S2puGCrJfSEkqpTkR3mwbfpuqWL5OPHispSWiyEpNc
 CB25dql/6KqUFK3v73tlypYh2RWZt1m1nySF2WHWvYffowDb5PRjvYO3H8nq+BVU2rmj
 CLX724GxOnDM/Brwo8bNCsDY9AZzlwIZ4M7390pgy2+l8SKEyEawLD5JCFiuQJ7dhXNt
 giNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNmpSnLQPm63kl684uWiRSWlihMm4iv5IcyfVncHJDo=;
 b=t90gIUUwAEpb7KatjXJ1PG4HQqgwbT+ZRJHn64RfbrvLK8B6T2SxyPQ/ltreBqZXaH
 9Jb6vzmnYkzs70BG4JaQQJvEIM/oltZVngTHoy3aQNhsXF1cMEiqpzhqov+gwPn3j+yG
 JBgP4NutD4P8nmPOXUPjCV+9qxWJ68JqYVHRkJTx5C3kBOmW7w9Vp2k8vsNg196xR19K
 4UOjO293mooQ+2cEuKUCNnpAxR5ix1OFfElCq+Ceqe/kvDL1zmxrPcC1hyR/ljGsRiY8
 JTc/fBb8P+q9/byeZMQINhuWko4gBFdBye2EAyAc0U2WzmVmHtLJ837iOgAFViPi7oFf
 jOaQ==
X-Gm-Message-State: APjAAAXXZ8XcdYZUvIRmLokp/RQRPFmt16mfVlTCrYBdtzMGPAoXLMdA
 wc5nRfxwMAkPyoiBj6znjjOMWw==
X-Google-Smtp-Source: APXvYqyOFooA8a5KxcafB07X4jMGNEAGYRW6+C7OvoGQ+LyxmeImqF5PyvF2Ys3mNiiHRaTYep04Mg==
X-Received: by 2002:a17:90a:b904:: with SMTP id
 p4mr30068161pjr.62.1579015783891; 
 Tue, 14 Jan 2020 07:29:43 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id d2sm17681630pjv.18.2020.01.14.07.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 07:29:43 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/riscv: Fix tb->flags FS status
To: shihpo.hung@sifive.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fb13179-c56b-8270-5c64-06ba1d05943e@linaro.org>
Date: Tue, 14 Jan 2020 05:29:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102f
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
X-List-Received-Date: Tue, 14 Jan 2020 15:29:48 -0000

On 1/14/20 12:13 AM, shihpo.hung@sifive.com wrote:
>      if (riscv_cpu_fp_enabled(env)) {
> -        *flags |= TB_FLAGS_MSTATUS_FS;
> +        *flags |= env->mstatus & MSTATUS_FS;
>      }

Note that riscv_cpu_fp_enabled is *also* testing env->mstatus, and that this
assignment can be made unconditional.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

