Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCAzu-0004i4-Lh
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 20:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAzt-0004hY-Ct
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:15:01 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAzr-0006Ir-7F
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 20:15:01 -0400
Received: by mail-pf1-x435.google.com with SMTP id g207so2590085pfb.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s3HSpAreezfoFBiffbGQoeWj4dJLtxR5T02v3WHo61Q=;
 b=pLSSmpnE79qYu8XHlGFgiznWuugc83pH7ddnSXHmkeXyGwp7K3eGaa1O9Urpedel12
 xL4nx32Nq6vjDCE5ERIlJLzVIwp6dim5/JUpDN/oLfvSCxVak4JNfO5Zdc2OhiJjYJAE
 LsABs0bfoVkI8iDXqk/bMgR7vGbmUymvX/whyN9s3DEL2J3o6/5m2uBqgtiXeBRbvhDp
 0cOarJrbQZa6pgmlbO4VvERGidzuvWHtXyHf38c0j33N4LhqEbYoKcxuqpnO9hN0rbY4
 yMwgxNjqBPwIWxOmUs3XXZysjCX+46EKxHf8NRzwwISVlc34I16MTeoWlLuXL5gDJ8gL
 lKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s3HSpAreezfoFBiffbGQoeWj4dJLtxR5T02v3WHo61Q=;
 b=IZnjpLoA/Cbiyspy0wIL4dPu4GlelgYN/zknb7QxYc6nhSm3C3rQjNE7glXw09QuSY
 8zWlqPk1GgR75iqWlatxPVMSmvBEpUB6DLzAMLKbVBTa7lFm28hOQjoHG1ytcMMtCMmf
 9M6zwvPyoNW608NDF6mMd87MO4QR5l0pocGzx2yPECQvBO0vSSckT3RNhB68tEeWJkq2
 wt5Yy0Lh6H2LMeLlwnsDotJLEBhLPEjMs+kuLej6i2eJ0NwwYbg+6xtY2+uxXXxtO/5X
 w2g8ZIXczARmjuqo1giQqSl0uGnRvjzEPM2/cu5cJ76m6oU1UrDwr/gDgCqzzRuD4wEx
 R+mA==
X-Gm-Message-State: AOAM530q6l+s0gM3+VDtfWAdV+TCdh50kIO3bkbYSMDpHLZo9EIoih+x
 SZ8GNK7ChhzVJv4vOlzsIqTVyw==
X-Google-Smtp-Source: ABdhPJyyDXp2Nafuh2I5NEcW9aVpt7m9HIWKjMafqqXFL5dGM2yFQjnEzv0z/XnY9L68YHzxblXblw==
X-Received: by 2002:aa7:96cf:: with SMTP id h15mr4377631pfq.294.1598746497675; 
 Sat, 29 Aug 2020 17:14:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r91sm3037749pja.56.2020.08.29.17.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:14:56 -0700 (PDT)
Subject: Re: [RFC v4 64/70] target/riscv: rvv-1.0: widening
 floating-point/integer type-convert
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-65-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <432875a6-295d-6c1e-18fe-2db968fada70@linaro.org>
Date: Sat, 29 Aug 2020 17:14:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-65-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sun, 30 Aug 2020 00:15:01 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> @@ -995,12 +995,18 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_xu_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_x_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)

Similarly, these last 4 helpers are not required.


r~

