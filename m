Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1G2o-0003wi-44
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 17:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1G2m-0003wB-Io
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:24:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1G2k-0003TL-Ae
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:24:52 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ha11so5764265pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mahhTW79vy6eiZRLeA9Zm11KUu30a8WlXdatRqFwIQM=;
 b=mlVmSy16dihlambeJrsetB8y0mWmZtwAt1tw7XzMma4GzuYf4cj9vEXNusuprpvqC6
 ZPmBKILfac4GTMyi4QorT0gAZaYv357MtUJkG1shv/d89MTW5WgMtEmc5HnP7NzUygaA
 ON0nFNQxct/YRN7VjG/6TPc+AzCCyT3cZFXnMcuAHiN8oSILb42sGyXoRQruYz4Jfy2a
 D+V2nH/4kEGj0Vcx+Vt614vGV5E7jHNXt35s8FZuOW9xv0aD9l01pUHRCwM/k/WA6EpI
 03XRIYE2TSS44V+j1ZZNly0jdZgPCroqbviULKE51c/pk0TLi3xkRTvtFmxf8hpckMdg
 3vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mahhTW79vy6eiZRLeA9Zm11KUu30a8WlXdatRqFwIQM=;
 b=bRYhY5hKPQMfl9tSbYKHU82jrTuTlqdODvWa7QlU4w/qdcXa/VuEzxMwdtnFjC6RTn
 QeZFOxms0w1nla3NsagBN320HtQ6wpcaO+f5FSEYnc5wyD+gp11qFAkQEN4nnvvBRfQv
 Qo307aBaPmT0esIeiCDNySwZrYBVrkboFHL0HEOjYi9DUH/KBRcqMQZjiREZLAEipZR9
 IYwOIu5iBnCK01WZ0cMF6eNkG24wVEFSHEGJaMWEVGepJWI8BzLsOHabh063GkbSvH7X
 ujwXmu71uMh81jm0fnCdWvQuiEmDiUnPwsCrjWYsvOEYoT7JUqpmrnmDki9XG1vxPooU
 DIaw==
X-Gm-Message-State: AOAM533WxcvZOLAOWYFOmyFZFIxqXM1HiXuMJjGMcIaHu336kVo4XIyZ
 zNAGWK6+/e9E23bfcnBrq5az7w==
X-Google-Smtp-Source: ABdhPJzeYZIa/uGxeXkEsTDx2R1UuSYdRnm/wfAAyw6fyr47vhHfo4Q0cvyG7e+Kj/RjwYiQD+ByjA==
X-Received: by 2002:a62:f905:: with SMTP id o5mr871254pfh.244.1596144288552;
 Thu, 30 Jul 2020 14:24:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 137sm8431382pgg.72.2020.07.30.14.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 14:24:47 -0700 (PDT)
Subject: Re: [RFC v2 50/76] target/riscv: rvv-0.9: single-width saturating add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-51-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9b14055-1e84-e8da-6901-4e3e863e121d@linaro.org>
Date: Thu, 30 Jul 2020 14:24:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-51-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 21:24:52 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Sign-extend vsaddu.vi immediate value.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index 956ee90745..3018489536 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -2374,7 +2374,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
> -GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
> +GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
>  GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
>  
>  /* Vector Single-Width Averaging Add and Subtract */
> 

This isn't what spike does.

The manual could really stand to be more specific here...


r~

