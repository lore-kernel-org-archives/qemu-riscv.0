Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7Oxl-0002Gz-9b
	for mharc-qemu-riscv@gnu.org; Thu, 27 Feb 2020 14:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Oxj-0002Gm-Fm
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:36:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Oxi-0008Pb-3Z
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:36:47 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34442)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7Oxh-0008PD-RM
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 14:36:46 -0500
Received: by mail-pl1-x641.google.com with SMTP id j7so215569plt.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 11:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RR7Rmmcf+FIgzkY0kiQKmj0flCfQOy2YCZTrv/2dkWE=;
 b=pxIXBzLoXb0v69ORAB1R6HPunPvUDVaRFjPJUZp/gcNEdOKoYd9NJdO1NbcRf3Xh6r
 mZn2+2XO15tQ/YhGa1YOTAYNmjb1tRcEiTezyI69EV+uw2ABdwnnOrIey/f9SXyq5DZq
 dJD5JGjaPVkPHJ43y68tCXWsj32CzgXBYw/YqjiWen6CrOIVhtsLiQ++XdyxTEZwRu+i
 1PvLoF2tIgG0feADCv8rjjcpskFm+5mRGZZCHVNe2rhpdxvJAMiU5/tN+CaXKMnf98Zl
 Wgb8fHvPM3Xi9LjvtCNB/GbjTKsJjjffDawiM9TQxAMgzN0kpWhe8rrA9FbJLGCrk1A9
 hRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RR7Rmmcf+FIgzkY0kiQKmj0flCfQOy2YCZTrv/2dkWE=;
 b=o2iBFvrRxHZos/XiKp1kvtgIAALuqCHHIr2A/1WNMFdhicu9gRDe6kiN/jq4Pw1ju1
 P8mTEWCHMyElEYgtYBk7gcrzBC4XafJfuXZaa2hyRjTM/IKz/EwPqap+L5J4sGVaKTLH
 5pVyW6TFdJdo+URISfDexthvYmnpQlvBwTawu0b9zVB5JUXgM+DXBHmU6MMYw4m1SkBA
 SASUoBz2QYqKUqNKioV15cItM3LK0sGjY8GOyXOfSMeAxf10sZC8pRWVVUnzmgC4Aj49
 lzE9w4+nH4R8edihMu4agFrl+H669/k3bfnBpAmdiFfJKBMIQF0LjnjUBtBB2wMl4mJV
 +Wcw==
X-Gm-Message-State: APjAAAWC5NXMDtmK5hlrbRda8HPUgNFXYk1qzTJXLA0XCIDvsymHIlGc
 aCNmE+YDanlHDA6Y4nQSgmF/6FWFNXQ=
X-Google-Smtp-Source: APXvYqx7Pzed3kqw3CzPRyLvp/Z6N7kxHXzr7DRK3TC8BNiTn4RW45cVAWOL+W/UokvdAlSflaH9hA==
X-Received: by 2002:a17:902:463:: with SMTP id 90mr335342ple.213.1582832204463; 
 Thu, 27 Feb 2020 11:36:44 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 w189sm7896561pfw.157.2020.02.27.11.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 11:36:43 -0800 (PST)
Subject: Re: [PATCH v4 2/5] target/riscv: add vector stride load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 linux-csky@vger.kernel.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200225103508.7651-1-zhiwei_liu@c-sky.com>
 <20200225103508.7651-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e806ca9-7991-baf7-58d1-50cddf9ce4ef@linaro.org>
Date: Thu, 27 Feb 2020 11:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225103508.7651-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Thu, 27 Feb 2020 19:36:48 -0000

On 2/25/20 2:35 AM, LIU Zhiwei wrote:
> +GEN_VEXT_LD_ELEM(vlsb_v_b, int8_t,  int8_t,  H1, ldsb)
> +GEN_VEXT_LD_ELEM(vlsb_v_h, int8_t,  int16_t, H2, ldsb)
> +GEN_VEXT_LD_ELEM(vlsb_v_w, int8_t,  int32_t, H4, ldsb)
> +GEN_VEXT_LD_ELEM(vlsb_v_d, int8_t,  int64_t, H8, ldsb)
> +GEN_VEXT_LD_ELEM(vlsh_v_h, int16_t, int16_t, H2, ldsw)
> +GEN_VEXT_LD_ELEM(vlsh_v_w, int16_t, int32_t, H4, ldsw)
> +GEN_VEXT_LD_ELEM(vlsh_v_d, int16_t, int64_t, H8, ldsw)
> +GEN_VEXT_LD_ELEM(vlsw_v_w, int32_t, int32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(vlsw_v_d, int32_t, int64_t, H8, ldl)
> +GEN_VEXT_LD_ELEM(vlse_v_b, int8_t,  int8_t,  H1, ldsb)
> +GEN_VEXT_LD_ELEM(vlse_v_h, int16_t, int16_t, H2, ldsw)
> +GEN_VEXT_LD_ELEM(vlse_v_w, int32_t, int32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(vlse_v_d, int64_t, int64_t, H8, ldq)
> +GEN_VEXT_LD_ELEM(vlsbu_v_b, uint8_t,  uint8_t,  H1, ldub)
> +GEN_VEXT_LD_ELEM(vlsbu_v_h, uint8_t,  uint16_t, H2, ldub)
> +GEN_VEXT_LD_ELEM(vlsbu_v_w, uint8_t,  uint32_t, H4, ldub)
> +GEN_VEXT_LD_ELEM(vlsbu_v_d, uint8_t,  uint64_t, H8, ldub)
> +GEN_VEXT_LD_ELEM(vlshu_v_h, uint16_t, uint16_t, H2, lduw)
> +GEN_VEXT_LD_ELEM(vlshu_v_w, uint16_t, uint32_t, H4, lduw)
> +GEN_VEXT_LD_ELEM(vlshu_v_d, uint16_t, uint64_t, H8, lduw)
> +GEN_VEXT_LD_ELEM(vlswu_v_w, uint32_t, uint32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(vlswu_v_d, uint32_t, uint64_t, H8, ldl)

Why do you need to define new functions identical to the old ones?  Are you
doing this just to make the names match up?


> +GEN_VEXT_ST_ELEM(vssb_v_b, int8_t,  H1, stb)
> +GEN_VEXT_ST_ELEM(vssb_v_h, int16_t, H2, stb)
> +GEN_VEXT_ST_ELEM(vssb_v_w, int32_t, H4, stb)
> +GEN_VEXT_ST_ELEM(vssb_v_d, int64_t, H8, stb)
> +GEN_VEXT_ST_ELEM(vssh_v_h, int16_t, H2, stw)
> +GEN_VEXT_ST_ELEM(vssh_v_w, int32_t, H4, stw)
> +GEN_VEXT_ST_ELEM(vssh_v_d, int64_t, H8, stw)
> +GEN_VEXT_ST_ELEM(vssw_v_w, int32_t, H4, stl)
> +GEN_VEXT_ST_ELEM(vssw_v_d, int64_t, H8, stl)
> +GEN_VEXT_ST_ELEM(vsse_v_b, int8_t,  H1, stb)
> +GEN_VEXT_ST_ELEM(vsse_v_h, int16_t, H2, stw)
> +GEN_VEXT_ST_ELEM(vsse_v_w, int32_t, H4, stl)
> +GEN_VEXT_ST_ELEM(vsse_v_d, int64_t, H8, stq)

Likewise.

> +static void vext_st_stride(void *vd, void *v0, target_ulong base,
> +        target_ulong stride, CPURISCVState *env, uint32_t desc,
> +        vext_st_elem_fn st_elem, uint32_t esz, uint32_t msz, uintptr_t ra)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +
> +    /* probe every access*/
> +    for (i = 0; i < env->vl; i++) {
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        probe_write_access(env, base + stride * i, nf * msz, ra);
> +    }
> +    /* store bytes to guest memory */
> +    for (i = 0; i < env->vl; i++) {
> +        k = 0;
> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
> +            continue;
> +        }
> +        while (k < nf) {
> +            target_ulong addr = base + stride * i + k * msz;
> +            st_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +}

Similar comments wrt unifying the load and store helpers.

I'll also note that vext_st_stride and vext_st_us_mask could be unified by
passing sizeof(ETYPE) as stride, and vm = true as a parameter.


r~

