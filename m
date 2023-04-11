Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm36V-0000ju-Qj
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm36U-0000jY-CG
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:47:26 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm36S-0003KJ-RZ
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:47:26 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-517bfc0119dso306118a12.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681177643;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tj2QkuRqtoTf+6Ske/YxMHcjyvAOfeUuFoPlt+O7SpY=;
 b=zZWGnGgwOYmTPtCUpoQUha4jSD0/uQ9GLaePmi6Wo2G7/ZSAjdzBh0VTc4I6iKCllu
 4en2F/n548DUCx0Ufz07psjHlEJDMIMGy6omqRlmywbZ4wPF6MjrZ7EyWdROkeY8pQ8d
 snC3gpGvVmgWfaMByiqCH/4OlztWBPMNqG6UBvvGmD1T2guJRrfeFGMv/fD3HEi0DgfO
 SiTJsWe8M9UePFhbnwWARlAa0YmlKX5ccog4qgUM7UOeUXx3Z9yPJcL90RjbCtGGAFGw
 dZTqxQEJVPyTOXf1WD1OmsfxeT6GM5gQhcvpGdU5ekKYscrQqjVAiyWo90Iv2T+ZVL3Y
 PmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177643;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj2QkuRqtoTf+6Ske/YxMHcjyvAOfeUuFoPlt+O7SpY=;
 b=moJUICFrtzrR8SDNqiyDC23Piz0ravbw26PkAqzcu3A5RTLPKgHJW4DdkzZ47cKuR9
 tzSqi5fGa3dkb2lqyBwYfFOt2wGryJMMpvLBnOCT7QuyOSJ8iPrcVvoKSnOKQSh0rVqq
 4Ikr3XSEWraZ6PiPIvmvVe7eMJQK/HdI0NEM5ObYjfIje36JAleqP/eDf4mU5spjwejp
 i9NET8KnSFH5f4SuB6A8m/49IkguSDuPBDVyP4uEbB9OOtzv1C5F6adDSziZToDv88hV
 gv2UU4U6u6uHwSnne08XdVAlFahQ02w9NNjiPeipSDpRZzqQLHPV/1tFCOX9/CancvuD
 /oAg==
X-Gm-Message-State: AAQBX9cMQVraGLG9fcxYDZtn8Jge86XfRUny0Ko3cc9VIO/UxEOFgl1z
 P1jW6X/kByaJEoGrgFlcI5tVbQ==
X-Google-Smtp-Source: AKy350bgcchkx+kkFzN8r6+p2Gkj+Ttl+odxOiLiQ78rYICjYZmXGP+wtQv4wm37nlcmB0PAT2XUYw==
X-Received: by 2002:aa7:96b3:0:b0:627:fb40:7cb4 with SMTP id
 g19-20020aa796b3000000b00627fb407cb4mr1151402pfk.30.1681177643166; 
 Mon, 10 Apr 2023 18:47:23 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 i16-20020aa78b50000000b0062d7fb53652sm8532221pfd.38.2023.04.10.18.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:47:22 -0700 (PDT)
Message-ID: <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
Date: Mon, 10 Apr 2023 18:47:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 2/4] target/riscv: Add fcsr field in tb->flags
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-3-mchitale@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410141316.3317474-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:47:26 -0000

On 4/10/23 07:13, Mayuresh Chitale wrote:
> The state of smstateen0.FCSR bit impacts the execution of floating point
> instructions when misa.F==0. Add a field in the tb->flags which stores
> the current state of smstateen0.fcsr and will be used by floating point
> translation routines.

Are you certain that you require a new bit?

Could the same effect be achieved by forcing one or more of the existing 
TB_FLAGS.{FS,HS_FS} fields to 0 within cpu_get_tb_cpu_state?  I.e. for the purposes of 
translation, pretend the FS state is DISABLED?

These bits are scarce, are we are nearly out.


r~


