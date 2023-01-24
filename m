Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKRFM-0005Hi-MS
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 16:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKRFK-0005Gb-RH
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:54:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKRFI-00054h-Ha
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:54:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso52429pjp.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 13:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33I3gmOMrqXDAgIkPqkp+uQ5domRkC5NGptWhMIhogg=;
 b=U5wHs2p3QtL3fW7wbrxQmXxNAqb4wBp2iWS60BzdogxkZJBB2UYiLDWU3OL4X4EywO
 tngiXdj/DHWAMZIiAdvDAuFmyjscdAwn7ya1ItxKVR0Ki2UvBK0ReEIszPW6jZWopIxW
 +Bp3fS9gKWLrhsxpyVQAu4KrrcilQqWGmfwU1/fYLT9dTdNw1ZBliCbOC0tdcobXc7oI
 ZGSKudJs6mw6LACWb+qWhisJHSj3W8DNuvIZ+gVrgizgKIgIoyEPJOh0U1pilQFOI3Pn
 +Bmq8dArqt23Rqt0/QC0/qQ+VGFyFViFLr2VYPgoCeklFIqZxd+dIijie8TtXp26RvQc
 4AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33I3gmOMrqXDAgIkPqkp+uQ5domRkC5NGptWhMIhogg=;
 b=SQ6hAtVzE45E/wIISTTjWgdewI1oBIW+w83pQTEBYjD4jrLPFUzQd606Uxko1nSqtT
 t2PiwOceYI6hnsJ5FVkJedmvmGpHSAufiu0zNt2UitLGkO/A3CruyTYZak2Zgwp7jn2m
 eHwGfe2xFfUkbHCzSMGy1IlF8jzSFL+78O7MSsiqScLYDrOJqF85491zUP0N1wQpWvGP
 OpbLMPrlJ1rLYIhIL5rSlKEdiWaw6eyaq4CYtK55irinmc/njZE1SLzWTfDvoItmeA+L
 ba9CKS0jocWhfK5rLqqhjXt2xs+QT0RP3kpAiY3Bqs+sqA9iP1swIDRFl6MzzZ3LNmaT
 D6fw==
X-Gm-Message-State: AO0yUKX1iP5rVrC3bbw/5js7789t+SLDPvLx36I/gRYYV4N4kKgZi+vZ
 ADENEoJwQd9K77wvuZr4GuHggw==
X-Google-Smtp-Source: AK7set90rRdU2o7QMLyGc0kQ4H+BIf4JTmjvmC7Bw/tjOEeqCT38lwBRR10aWc21bDf3z9d83PK5Sg==
X-Received: by 2002:a17:903:1107:b0:196:191b:6b22 with SMTP id
 n7-20020a170903110700b00196191b6b22mr3760694plh.59.1674597262967; 
 Tue, 24 Jan 2023 13:54:22 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z2-20020aa791c2000000b0058a7bacd31fsm2083427pfa.32.2023.01.24.13.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:54:22 -0800 (PST)
Message-ID: <4068c032-2210-65c7-3f5c-04f89b778e04@linaro.org>
Date: Tue, 24 Jan 2023 11:54:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 00/36] tcg: Support for Int128 with helpers
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2023 21:54:27 -0000

On 1/7/23 16:36, Richard Henderson wrote:
> Patches requiring review:
>    01-tcg-Define-TCG_TYPE_I128-and-related-helper-macro.patch
>    02-tcg-Handle-dh_typecode_i128-with-TCG_CALL_-RET-AR.patch
>    03-tcg-Allocate-objects-contiguously-in-temp_allocat.patch
>    05-tcg-Add-TCG_CALL_-RET-ARG-_BY_REF.patch
>    07-tcg-Add-TCG_CALL_RET_BY_VEC.patch
>    08-include-qemu-int128-Use-Int128-structure-for-TCI.patch
>    09-tcg-i386-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
>    10-tcg-tci-Fix-big-endian-return-register-ordering.patch
>    11-tcg-tci-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
>    13-tcg-Add-temp-allocation-for-TCGv_i128.patch
>    14-tcg-Add-basic-data-movement-for-TCGv_i128.patch
>    15-tcg-Add-guest-load-store-primitives-for-TCGv_i128.patch
>    16-tcg-Add-tcg_gen_-non-atomic_cmpxchg_i128.patch
>    17-tcg-Split-out-tcg_gen_nonatomic_cmpxchg_i-32-64.patch
>    24-target-s390x-Use-a-single-return-for-helper_divs3.patch
>    31-target-s390x-Use-Int128-for-passing-float128.patch
>    32-target-s390x-Use-tcg_gen_atomic_cmpxchg_i128-for-.patch
>    33-target-s390x-Implement-CC_OP_NZ-in-gen_op_calc_cc.patch
>    34-target-i386-Split-out-gen_cmpxchg8b-gen_cmpxchg16.patch
>    35-target-i386-Inline-cmpxchg8b.patch
>    36-target-i386-Inline-cmpxchg16b.patch

Ping.  Only 2, 3, 10, 14 reviewed in the past 2 weeks.
There is a very minor patch conflict now in patch 4, nothing worth re-posting over.


r~

