Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtxB5-0003Ht-Si
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxB4-0003HV-9H
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:51:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtxB2-00018A-Ld
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:51:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id t15so2924685pjq.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=avoF3qspIGHMxjGxvwi7YRJvZdniZ+4Dd1+ivub60iA=;
 b=nbN5jS+lTu337pJoHX2dGDwkV78iU/btb0VR8nrGOxJ0/mnlD3sS6ij/8EjqFuFF1I
 IJk7IkLYzdT2c1Jt9zsXj+bId7XK+2EmlC2XpB3MQ863aSaB2vavJFp3PuIjozlTvHrL
 zDf0c7QlUdjNlHAnacc8x5ra67jUhs9TUfdbfgdSDdnS3YQMaB1flAAmI+EOwm5sgohv
 G/Pw6V9UqX/ySdHjf/mxBeHNNtIVBrdrhY+V4CM+122FSjae2geIT8fD45n5563CX6jE
 VZgXcDq15Rc6FRE9eM3PdCeTpnv0FLVORDTeIp7An74PhQX9JiLWjhIXfV3PohFHTPRb
 X4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=avoF3qspIGHMxjGxvwi7YRJvZdniZ+4Dd1+ivub60iA=;
 b=gqENi5ohntgt/aFD2m1PCaAYNBJ/KwSBcdTpM81vYU6q6rBkqX5oVJi6kHFwk7aMkg
 BaWvh1Mo18Ajj7/EhVPFDL0bvRnds/Y0P336EtOV2dd25g658mYYEk3JFxdJIYIdmcZO
 HDLlk6+LnFBbYa6qcF481KIQ+MQ8a8P10+6B7WeoToaIV3AZWYJ35slzCacD01Zu6MCC
 Jw1H29kUFUT3irGBWliPb4i/nLyucaQ1PHALzFl3EL0NVJexB5wjXHgKOt/KZPGF9Rwx
 WfTPd4fB9251ho3QF4PLmGNC3FDCNGYiFkpkj+WR2WWGiQTcQXRg7ChfR/W+810+p1JM
 g1AQ==
X-Gm-Message-State: AOAM531c+2qKb9cRveyRtFO+jmj4sbI5laZR25Is4t5JVo1s3Sq7lue6
 VUWf4Q1PCiLH6SvzqsX0O7dguw==
X-Google-Smtp-Source: ABdhPJyEBQjzs5f8x9Rlt7AFj6JiR0v3u6GSNK4++N0Jp9TKE6KGaZc8lviaiTswaLtbcOHjo9xAAA==
X-Received: by 2002:a17:90a:ff16:: with SMTP id
 ce22mr7220765pjb.160.1594403471087; 
 Fri, 10 Jul 2020 10:51:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id ml8sm6051475pjb.47.2020.07.10.10.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:51:09 -0700 (PDT)
Subject: Re: [RFC 12/65] target/riscv: rvv-0.9: update check functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea39eb18-20fe-eecf-454c-6afc04d711f7@linaro.org>
Date: Fri, 10 Jul 2020 10:51:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 17:51:14 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> +#define REQUIRE_RVV do {    \
> +    if (s->mstatus_vs == 0) \
> +        return false;       \
> +} while (0)

You've used this macro already back in patch 7.  I guess it should not have
been there?  Or this bit belongs there, one or the other.

I think this patch requires a description and justification.  I have no idea
why you are replacing

> -    return (vext_check_isa_ill(s) &&
> -            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_reg(s, a->rs2, false) &&
> -            vext_check_reg(s, a->rs1, false));

with invisible returns

> +    REQUIRE_RVV;
> +    VEXT_CHECK_ISA_ILL(s);
> +    VEXT_CHECK_SSS(s, a->rd, a->rs1, a->rs2, a->vm, true);
> +    return true;


r~

