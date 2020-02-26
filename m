Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j736S-0000pW-Q3
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 15:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1j736O-0000oR-De
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:16:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1j736M-0007S1-1h
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:16:15 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1j736L-0007Oe-PD
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 15:16:13 -0500
Received: by mail-pg1-x542.google.com with SMTP id u12so192539pgb.10
 for <qemu-riscv@nongnu.org>; Wed, 26 Feb 2020 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nok9qv+wkzhDcKoXaJgQjFCCfdLB1x47k3synkZL/A0=;
 b=azI04b+88s5jkPhAG5Z5fRq0bxOC6dPyqfTgq6uiGjEOOu2+pMrDt8CK8nTUPEp8RW
 dZWPqU3jV3SSw0dd7eNxwYh2IY1/yxIAoiBqgdmMK/HUzSdowvLomo14bta2uWOmQbE4
 go9N7M/ofrtSXa2B2HnCTRwnc8oM9XDaOVR/KDC1CTgl/Bqak9fGvq8hnW07KkBsG0zv
 NQAqpdprodiSuBq4YdY+6WpM0x6Y4bhoJ7vWJIkfJiDyZan1kv79ELD/bNFDJZ/zW9AN
 wRZzEg+NieEu/TkxGgAaUqWuMaTivzo35MZG+s+oF8CQDg8HSGqraX/5ABK4uM1/IdW2
 NuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nok9qv+wkzhDcKoXaJgQjFCCfdLB1x47k3synkZL/A0=;
 b=oy8X+vcHXMQUYmTn0LQm9725CXT4pMN8WiA9m0+iWzE7NeUJmGlkDMbxaymxuaihG1
 b688Au+Wf7Q9XcOJs9JcBf1kV1ApMnRotLheITSQFVPWfG6NR4H5Vj1uks0TAJaDYndD
 EJKiSmI5rT35L1FGh42C5YIigeQuKaVoFlv5EjabGFEHWKqEF/NXp5vP7TF9xFG2HAfL
 GRjBAv1eHCFiFOI1+c83qAy25zB9mQx2JMEWxiaJgLjJ8KQS2wgo6b3zB5Ap38hM0AfW
 7k/oKlnDUjaTwj3blJVvXxR0KcngjS42QSfglPYf2M9Mu3PyShDTJgz9XGp+dWld6Osd
 C/Ag==
X-Gm-Message-State: APjAAAUQbun0a3ZMW4E2/t1+OoizRZb/lTwzd5BnAt8+cV61WkhAch8k
 qTuu6b/Q2HIbQdEv0+jR5k9n9A==
X-Google-Smtp-Source: APXvYqxlWgSsZY9En9EsJfZ4j5n2IuJKa+L/RZoEOX65jnQ4m+TxlIK7JJsmDIpmL6WMFpSw5DTLOQ==
X-Received: by 2002:a63:921a:: with SMTP id o26mr559819pgd.246.1582748172556; 
 Wed, 26 Feb 2020 12:16:12 -0800 (PST)
Received: from [10.17.0.226] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w184sm3394544pgw.84.2020.02.26.12.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 12:16:12 -0800 (PST)
Subject: Re: [PATCH v5 3/4] target/riscv: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, richard.henderson@linaro.org,
 alistair23@gmail.com, chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-4-zhiwei_liu@c-sky.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <39e7abd9-bd5e-5114-975a-5bd3161c6690@sifive.com>
Date: Wed, 26 Feb 2020 12:16:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221094531.61894-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 26 Feb 2020 20:16:18 -0000

On 2/21/20 1:45 AM, LIU Zhiwei wrote:
> +/* Vector Fixed-Point round model */
> +#define FSR_VXRM_SHIFT      9
> +#define FSR_VXRM            (0x3 << FSR_VXRM_SHIFT)
> +
> +/* Vector Fixed-Point saturation flag */
> +#define FSR_VXSAT_SHIFT     8
> +#define FSR_VXSAT           (0x1 << FSR_VXSAT_SHIFT)

These bits have been moved into the new VCSR register.  And the offsets 
are wrong because these bits are no longer above the FP status bits in 
the FCSR.  So this needs to be rvv 0.7.1 specific.

> +/* User Vector CSRs */
> +#define CSR_VSTART          0x008
> +#define CSR_VXSAT           0x009
> +#define CSR_VXRM            0x00a
> +#define CSR_VL              0xc20
> +#define CSR_VTYPE           0xc21

This is missing two new CSRs, VCSR and VLENB.

> +    /* loose check condition for fcsr in vector extension */
> +    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
> +        return 0;
> +    }

This is wrong for the current spec, because the vector status bits 
aren't in the FCSR anymore.  So this also needs to be rvv 0.7.1 specific.

Jim

