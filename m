Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YgH-0004wt-8t
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YgG-0004vs-Bp
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:18:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YgD-0006XQ-Ly
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:18:52 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t10so12419499plz.10
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BgSLifIsjwZZcBuz8dVhcHgyO9B5S7lmDSsidn38h6Y=;
 b=KpMNnTIRFC4VQ2jgDOJFa1CyIRKpm9+gPvfFlNy8hyNb7XIovyDF1ji7gl2z4hyhWb
 lXH1dysmAFK35JLe17cHnimsH9+xuFR+oa3X2ACPMqXqRsZeIovMHICUAR6tzKKZzv8I
 3dEU7zYVTLN9OhnI7rW7RZxJu5e+f9lcdVMEP2YkVKLZqeDbKqki0oM1hrZ7korE73U4
 mQF2INr2sb2aKNjtceQ91UYO7geJQwWgG24BnrHKWfWot0i0sszZIkUqc64QZi/ZXaqd
 9V+AwR6tHKdupsZ2hbBRPydJ9Lz6e0W9wy2M3ZytU/DVJBZno2P9jJ20ArEsDpOmE474
 WLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgSLifIsjwZZcBuz8dVhcHgyO9B5S7lmDSsidn38h6Y=;
 b=cUi3AZ3EdMYmDzjcDESdug2dYAhO1s7zdrAiLJJOULdq3hI5YaOZN/quS9rgq05DfF
 +6CLhgku6MIukqf23Wh6EXbeKVhfsCbmJH5nsG7ITjHSd8riujTNG2JudCqr0QmCEF4n
 UUExTkkfXH4fTj4qC/tuuie5bgywJjcE9Ov4GVIC31qe3+B2UpsaiEXArfLl8ZglPZsi
 gBJskOevIBd7PphKvSwsMpYQZzYJWCrJDYsqrIKTGNZw3U6r7+iqFeaSSPw7E6VMSwO5
 JmJGDOYHXj/ZwNIhzz249PBDMDSBfhovoTXb9rd59jK0/E8Y34ImKv5mcazbdmrO9adN
 +dGQ==
X-Gm-Message-State: AOAM530iILqxdjvqEHFh6Oaoad99Xf6kYhYAItKCdqM70POmnj/mKu8M
 A7Rc5etqjMg+H8/r3dsRaFE3Jw==
X-Google-Smtp-Source: ABdhPJwuIsKPhtUV0SIwRy9VJcxrg7vrwbPYr85Go0EQT2KeWOu3GhXKx3LreRTrjDPbARkfsVmXOA==
X-Received: by 2002:a17:90a:8a90:: with SMTP id
 x16mr4977780pjn.89.1596215928071; 
 Fri, 31 Jul 2020 10:18:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i68sm10140796pgd.32.2020.07.31.10.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:18:47 -0700 (PDT)
Subject: Re: [RFC v2 72/76] target/riscv: rvv-0.9: narrowing
 floating-point/integer type-convert
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-73-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adbe61bf-45b4-825b-5b27-b9a834493cd1@linaro.org>
Date: Fri, 31 Jul 2020 10:18:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-73-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:18:52 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> +DEF_HELPER_5(vfncvt_rod_f_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rod_f_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_xu_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_rtz_x_f_w_w, void, ptr, ptr, ptr, env, i32)

Again, no rtz helpers.

As for rod... I think you'll want a new helper akin to
helper_set_rounding_mode() that sets float_round_to_odd.  We don't want to
change helper_set_rounding_mode because that's responsible for SIGILL, and this
should be an interface private to translation.

You'd probably want to add a private value for to be used only within
translate.c and insn_trans/*, so that gen_set_rm() can remember the odd setting
as with all of the others.  E.g.

#define QEMU_FRM_ODD 8


r~

