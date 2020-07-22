Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyHNE-0000w2-7V
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHND-0000vW-53
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:13:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHNA-0003Lw-IH
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:13:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t6so1534484pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Re2PK0LJsagIgr6c5yITwnXVNSmcxrZuYOW7wUFVdU4=;
 b=leUSnBs3HcLfwGEVs66IHc6kcTgNimQa8ATf/L8Gs1KyNxctQh8IH4vXa+GyKbur2E
 tErgWE/7ZRxlbMwdl+RY6zcUhRIn3p3XIVVduNLLSATWhePWJx0ymHnMB5VlMClgNM73
 pKjgAhyONNY5ybqwjx8eCf84uRVSlDHejJSJNVBhQoymL8dEL2oSnu87dPLctZbkoFbm
 rmk0yzDHlgUVACRHHYb9PYj2Ahuosk5b1NP5uwfv/dsboqiBjixS6/IPvqs9TiQ2mFdh
 0uh6TYna4OLu7TMXJA/m7BXNUPI+XxoV8XVSIFh/AlrwP0x00+GWSafIyJIgPB6a9Uas
 Vq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Re2PK0LJsagIgr6c5yITwnXVNSmcxrZuYOW7wUFVdU4=;
 b=e9HPrhSusEOaEFSxFvxz+L+B3/8C6wJbBO/U6PB0Syt2SMZDOjzuIVI41LUIljieN3
 0YkmuZXgdwuwCzG/SzTEQ5hgh+NBrTfF23R09qjNGKDbFbDMW8VyGb3OjelEMCZYlyaJ
 crTBE9D++aKIhUkiVVto9FotdD7xrfWs5pNno/FziUZIG3UCGlsfQLWQewqTWn7iuau0
 r6INssQplXqr72q1qJDU6P1KB6Mk5epWc9GZKc4qDXF+UjXPm0sftfjvYCCtcrdfoqKd
 mgqsd4YnAJyTrtzUUXDScXvv+i07mdKFWU8plBoiy5UrpJDmx+2Uvij4OcxAL7rUb0Xp
 Yx4g==
X-Gm-Message-State: AOAM530yTsFF1j3Ehdr3JyxtNi/NSe6IYUUT/ph6W4ugL5FR/O9UQK2J
 jx1nmpZsA0mfSW6CitPQm+CEJQ==
X-Google-Smtp-Source: ABdhPJwL/QCh4Yr2vyNbk7Y1ic+zVK0k9/kfInodsWAxRxTtf9jrnNFbEIM5Esfkf7ds/AJB1coZNw==
X-Received: by 2002:a62:8603:: with SMTP id x3mr374290pfd.268.1595434414764;
 Wed, 22 Jul 2020 09:13:34 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 gv16sm159966pjb.5.2020.07.22.09.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:13:34 -0700 (PDT)
Subject: Re: [RFC v2 02/76] target/riscv: rvv-0.9: support vector 0.9
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <172338a7-1553-dd19-c6c0-f02f4c538b39@linaro.org>
Date: Wed, 22 Jul 2020 09:13:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 16:13:39 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.c | 24 ++++++++++++++++++------
>  target/riscv/cpu.h |  2 ++
>  2 files changed, 20 insertions(+), 6 deletions(-)

I think you can squash this with patch 1, just so you don't have to churn
functions like set_vext_version.  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

