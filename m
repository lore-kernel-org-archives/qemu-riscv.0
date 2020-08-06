Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3orr-00005S-VB
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 19:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3orq-0008WK-Nf
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 19:00:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3orp-0007vS-6q
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 19:00:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id d22so7593590pfn.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 16:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tDvdeLoqAS5o0vI6v0zz99GNsMFN8hc10UgJPe7JNWM=;
 b=BvQEKXWEF1vSYxlCCYQZsiRfBDFlOS1GtfvTdzAfNbkRqvMSfyeGmJF6CInZ0NhiyY
 Q1YOJOiU9q1wSzEAwc0hR9gesDYJ9qqZNqJ4I3NpGLeM/OpbtNumrmKAPDIqQ+mpXTo1
 1rORAMDkARoSEktXJajSouCdMg0x9uHxELEkWHqqKNhqYEKM7pnJ/VCuWtV9w+VO8/nT
 QE0DxcPGLeEPvL09pR/3zvlS205cp7JhQ03mvZQgE2r3HuhW86nD735uot2eRbjAuAN6
 urTKOsz1MxVnMYc6Ux74VfXF+CRYzEH/q67wXTKNRNF91Tp5o+Kz3PBmHlsuEL2QFvZI
 xK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tDvdeLoqAS5o0vI6v0zz99GNsMFN8hc10UgJPe7JNWM=;
 b=hUFeqkThZJ/C/jCudeA1N5r1am84F+Q1ejWxMxtADYa2fUS/V2V1m+vYmFEk709mQU
 9loci5CTQhaNuvmOp77X18UOiFK9w6QDieJqq3Mjdp9Muy8g0EMw8K0cIPCLFSLUj7he
 nclDRbPNFkUHI+piYCXOHkf52kUW+lqZFZDLIPreXOIT/NKs/S3nWKiHiE6Rlx5LQ0S1
 31Ulr32h++oR5YYzjTauQ9FW2IcS7+Oyts8Ka00IQ2HA/Ao2rx6vSDTsRnmbckWHMsEH
 vRlt9yErcBUKFGm3+bbtR2C45JG5umOHfcBNKJN6TntmYS9wDVmhqrhFXI94SWyUwzrc
 h7xg==
X-Gm-Message-State: AOAM532U7MAUBSFZF51y20XJnRZtV2yMAqLEm+ulFNzp+0cnPEQ3rbMk
 zkp+/fxTILB7G6/72KbhITTBiA==
X-Google-Smtp-Source: ABdhPJw6cR4/m5UZ1a6qFPQtdAj1bPwE7bDCziYhmEPMsyEx/jQIOD18PEWwtCYLzgRe5e9c75LmbQ==
X-Received: by 2002:a62:e202:: with SMTP id a2mr10214279pfi.140.1596754807066; 
 Thu, 06 Aug 2020 16:00:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t25sm10794494pfl.198.2020.08.06.16.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 16:00:06 -0700 (PDT)
Subject: Re: [RFC v3 18/71] target/riscv: rvv-1.0: apply nanbox helper in
 opfvf_trans
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-19-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe616a74-adb3-0357-dae4-d6f2c7139385@linaro.org>
Date: Thu, 6 Aug 2020 16:00:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-19-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 23:00:11 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

With patches 16 and 17 merged into here,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

