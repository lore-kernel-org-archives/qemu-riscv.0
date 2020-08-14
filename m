Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6cMw-0006t4-CQ
	for mharc-qemu-riscv@gnu.org; Fri, 14 Aug 2020 12:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6cMu-0006ro-BD
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2020 12:15:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6cMr-0007sc-Vf
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2020 12:15:48 -0400
Received: by mail-pj1-x102e.google.com with SMTP id i92so5803306pje.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2020 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tc++8Na5cDnfChJBn04qcGXcsQWdWKCUlmR4LLPi5go=;
 b=NntJVDfuMMP+tlDBU/2Xk0KCpZnvSXRrcNwAj/Y3F99sbr5dkHteld7rEFrJaj4sfJ
 kzeFWHivBTkXumAOXRvPV4L+GvfYmjGhbmc40aV3nK76SCLUuLXBeNPvWJaTd+t9Ht9h
 uR3ZZUJb7h/z/nfI28svy0+ReJ8+IgysSobOuEFIJHZ4TGdngmPyIhG/wAyPNelLuYi9
 FkEJnyt3DAEqCGCKiOooBJl2wYv9mh19fPumZR8zUwHKD9A4oJurTUqLmCi9k7bjKxL5
 WnFmgevCg03CAv2YMcDYbtCVW6sf19Xj09fs8w0r8a0BkrlrFL7i32dUW3JdOtYH1LIi
 yCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tc++8Na5cDnfChJBn04qcGXcsQWdWKCUlmR4LLPi5go=;
 b=Xqjuc3VOvlVkHMsF77LrGLDVTxmzFzmQxRQwmdV77NksDep5BSat8BAdIJIndGPoz5
 bdYo3sH881w+yZddb2753n/dqoLK9JurQgRnnRke2IjqawP3Uz9xkBblm7oZC530tEaA
 Gv2SoYrBA82A2SN7Jli8QIFpor/CLzuqZ1ES7eNV5losEFvXE8mKo9Vz6xzBbCguV3Cn
 +ucCTsgeysVFUFwjEbbbs3DbK+qR4uUjhjmTqwTMbcHxlbiV7DMvGscN8q8D4uybf7ET
 Zyju7aBTa80srVEs0phVl7TEcSjrxRPT1ey3eNl6ZptDaCumFdFCLI2fvwAv5GiMYjK8
 SyLg==
X-Gm-Message-State: AOAM530KDL+LipMCMyZvDQMIaro0v8jYPuMawslDH8lkz54noFh5dDfh
 UMPQTWLd1JAyKnH8K/VX9YKAHA==
X-Google-Smtp-Source: ABdhPJzr9Fvt6iRRs2WWLp+wxHzys0A+TmFqw026KJSTcW26PJBmkHm1i+mfilgi8elDv3g4dt6NtQ==
X-Received: by 2002:a17:90a:fd82:: with SMTP id
 cx2mr2984914pjb.67.1597421742816; 
 Fri, 14 Aug 2020 09:15:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g5sm9770896pfh.168.2020.08.14.09.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:15:42 -0700 (PDT)
Subject: Re: [PATCH 2/3] softfloat: add APIs to handle alternative sNaN
 propagation
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
 <1596102747-20226-3-git-send-email-chihmin.chao@sifive.com>
 <aa334be5-e325-8d96-a3ee-00c82cfe2c4d@linaro.org>
 <CAEiOBXXOj5TcseHqpCaB-vR=3wFquP2ScjKGSrPXombesyD1jg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd0acee8-1786-a3ff-99bb-4d8e317abcde@linaro.org>
Date: Fri, 14 Aug 2020 09:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEiOBXXOj5TcseHqpCaB-vR=3wFquP2ScjKGSrPXombesyD1jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 14 Aug 2020 16:15:48 -0000

On 8/14/20 1:59 AM, Chih-Min Chao wrote:
> By the way,  the other patches have been queued in softfloat-next. 
> Do I need to resend the other two patches in the next version or just this one ?

Just this one.  Thanks.


r~

