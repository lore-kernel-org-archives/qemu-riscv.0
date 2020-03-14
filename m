Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDFt7-0003q2-3M
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFt4-0003pk-NM
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFt3-0007XT-Rw
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:08:10 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46661)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDFt3-0007TL-Kz
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:08:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id y30so7239328pga.13
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1TkZPilsn+jl35ez8OZ36Wsu6xin6wdaz7FWIvDFTkk=;
 b=EjeqHHuGfA0yP3aCZfux1h6+CNyFRz62tNQGtqXox33Ddr9b52kdiRcjog6VZHfEAf
 cJZV7gdrNKWlcL18yl36nI83CRJpS7iSzJPrPHfsqnRPejo8d4GYA2/47mCpvXPe/JGm
 FO4njLl88rnqK8QWIrgyW1fTGwZzS7MVGQyL3kN63OQwfUiEkuy9tijmzFVJM8lk/e2I
 lLu0S3qfsIMFHMsBrWMamC6je3Mv8sjKIm6nqq0rcDMWrzuu/RgoJbC74DGQ+8131ss1
 ZH9PRNyWuomEdOL5sNeesQ86lzxOKwWNWKv1RlozAMxQEqVgmqDtiOGl2fxAyWnhyg66
 bISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1TkZPilsn+jl35ez8OZ36Wsu6xin6wdaz7FWIvDFTkk=;
 b=MwFwqxki9EWba9E6P6tFRx3upa2R4KnOTK5bLI10wftG8ndb7X5P+QrFti5izkc1xk
 qtCuYqC5+KMjNlfj00lWd86N6pMJQkIra0hryo8hdgkZNUK6gWQVDKfVHe3DGs1dCpiH
 /yXmerjc1bJi16s4LP0ahAE5RMelH5u4ut+EQTZLX+aYN49fk1/j9ccBZRcDSd85Tfdk
 4culJNBy8AmQ25OHn963Um8M6lzE//NXXN4a0HqsYbxRhiCbDo1K9Vbstev5LvTeDW48
 3aosH3w+JP+cmeNK0xYpf9FQTWa0jExT6OfRp+Y85Fsh7odI/aGLarCMbiAXRrkkP2Aq
 vtgw==
X-Gm-Message-State: ANhLgQ3fDrUcIa0cVTVpG0O2z0HSM68TK4/uDT/re+3ccSYJxHAEMZxO
 dadeLVSyRdSJompxh1qzsgRgsd65kgY=
X-Google-Smtp-Source: ADFU+vvsbLfjYsNc4D0coPuDu08yxb71hpvxnpY1aDG7PCeXxe1Y5qiZLRFVufZpu7XTB+0cmou2pw==
X-Received: by 2002:a63:2542:: with SMTP id l63mr19671502pgl.312.1584227288404; 
 Sat, 14 Mar 2020 16:08:08 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d7sm355063pfr.17.2020.03.14.16.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:08:07 -0700 (PDT)
Subject: Re: [PATCH v5 43/60] target/riscv: narrowing floating-point/integer
 type-convert instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-44-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1d4b32c-47db-b399-4c14-05d9269bc3d3@linaro.org>
Date: Sat, 14 Mar 2020 16:08:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-44-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Sat, 14 Mar 2020 23:08:11 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static uint32_t vfncvtffv32(uint64_t a, float_status *s)
> +{
> +    return float64_to_float32(a, s);
> +}
> +RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
> +RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, vfncvtffv32)
> +GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2, clearh)
> +GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)

Same question as for float32_to_float64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

