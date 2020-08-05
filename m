Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3MbB-000760-Ah
	for mharc-qemu-riscv@gnu.org; Wed, 05 Aug 2020 12:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3Mb9-00073Z-63
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2020 12:49:03 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3Mb7-0004MR-A4
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2020 12:49:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id g19so12992443plq.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 09:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2jkOLs2Fczrz+WeSwz9LcNBM209XPoRACV7oi+7U/TU=;
 b=Sv/nT8UtC1YzA1aHmoS35NwUydAHOa9cqhv9e32WO1wH3BBk9/zuGKExOfcc0tPGyv
 GhoT6I/xyle1TM74gqr69wkVIDLVcWPXcGdo6uRkYnVYxto++8mRS2TUIpqrzYRwdPYa
 AkWtXoc+nVIqpSh2smcAYnK3KBu+Oxd/ZZDVrTlX6Vq8snJIo6viBvXGF0kn7pC2R4Yu
 /WC7VcCcAuzNkwBPp+bS4XAvcqdMW9A9GgrF4Z54YMLhZsht7bOUQfIJGJb+jhl/0Kvc
 htDnJ51gSnmXk5ri1qUd89Up1Gg/sifr4iQwugZJosxkkAQXUnpZVIvtpTAWPH+/ybCl
 rRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2jkOLs2Fczrz+WeSwz9LcNBM209XPoRACV7oi+7U/TU=;
 b=gQI8aE+sJ8UlfacrmOUW+xIVp1O9MRKbH4+Zr9Q2dONPFDrGnkcTranS5x5iJXlEVo
 be33KmBnxJVAR9aLfXga2nEFRbQFKvVdb67PKDEAC1GYBaL64PKHlTpbvm9dI2CIGYt9
 knyMnoG5yHsi5YnVmTMSXiHW7XkQ+KD1CDwGV6nOxlBKFuPlgUuHQHuU3bK/Bbbjrljo
 C2Fw1rgesrQx1ep/52DsSvJRqaQsRiP+hND5uyw2SCZhLVaDScOY/HKROH94Utjk/loN
 0r8t9zPVy8mVMN/WqCn85/Vi5uYBsD9P/KBJ43lLiklorVk489yfkfGcN6deqsYbLxij
 xKbA==
X-Gm-Message-State: AOAM533oPBk6W3yo6+apE7m+y9ango4p4dBM59Hw62bHtPsohnpVlOXF
 1U9GiFK1deRFCSe6+OTShxDqOw==
X-Google-Smtp-Source: ABdhPJwtnjFlbSNWyTmA2pscs9aUd5J286fWFCMlgTRyFurNZt6JibGWZXv5IyfyKfK1Vm6Wo65Xrw==
X-Received: by 2002:a17:90b:94c:: with SMTP id
 dw12mr4175111pjb.214.1596646139414; 
 Wed, 05 Aug 2020 09:48:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q73sm3845350pjc.11.2020.08.05.09.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 09:48:58 -0700 (PDT)
Subject: Re: [RFC v2 50/76] target/riscv: rvv-0.9: single-width saturating add
 and subtract instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-51-frank.chang@sifive.com>
 <a9b14055-1e84-e8da-6901-4e3e863e121d@linaro.org>
 <CAE_xrPjg=AAeDVT5GbT0mQsxVQ-O6DaYnCzgaxxor6nMZWENEA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f89bc990-5458-05ec-b135-2cd0c6b1eb38@linaro.org>
Date: Wed, 5 Aug 2020 09:48:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPjg=AAeDVT5GbT0mQsxVQ-O6DaYnCzgaxxor6nMZWENEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 05 Aug 2020 16:49:03 -0000

On 8/3/20 7:40 PM, Frank Chang wrote:
>     This isn't what spike does.
> 
>     The manual could really stand to be more specific here...
> 
> Isn't Spike's vsaddu.vi <http://vsaddu.vi> immediate value also signed-extended? 
> /riscv/insns/vsaddu_vi.h:/
> /vd = vs2 + (insn.v_simm5() & (UINT64_MAX >> (64 - P.VU.vsew))); /

Whoops, quite right.  Masking to SEW, not (u)imm5.


r~

