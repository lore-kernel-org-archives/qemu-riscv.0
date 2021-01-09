Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyNug-0007ng-Kc
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jan 2021 18:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNue-0007nQ-Mv; Sat, 09 Jan 2021 18:44:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNuc-0007IZ-92; Sat, 09 Jan 2021 18:44:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a12so12492330wrv.8;
 Sat, 09 Jan 2021 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2B51YU1ND6bTL8D+R24rsL0MVIflY5eujeOzJPTZ6Y=;
 b=NkVvmTuJe9QsDe6qZGw9cluI9lLRWUyjKZ/lDa4yx6XV8oys7laL7zZR6p9Y2PZc0T
 vp/EqjzbkUPpriG9IsvJLWtACP6VFlU0YACDgz/QLFrC6SVWZ+PHr+DD4BWs1SEMD5iU
 Rijf57D5rBvhsuIja8tyFHe4fLFqVm6isE281ts2gtwkGKlhG90xI/5HZE4PH2lGq6pd
 2YPHBcShGRff15FoJ4YG+3V71lbjBAyrDUdEFPtWzt1Ah6p5ZeYi/ltc0gks+KJmZyEe
 Wh8y3lDMRhrpkkpDV663OvnCBkhJXglNDti0FvMaXn2E+nL7/uaLceuQqnrIEYcxxA+t
 BCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2B51YU1ND6bTL8D+R24rsL0MVIflY5eujeOzJPTZ6Y=;
 b=dFY3HXfv99c/goFOnDbNAbhP9zorosU9oRhC1QcZC2L23lz6jyNRvYXJMJDrNN0I6Q
 S3LiaX4wQgyMumsp3CP8lxcMF+IufEm4teO1szYg6LJ5pnLrlh90Tl5iOzF9IaF7nJXI
 cRs85hiRlR10KTm8z7OMURe6MrzxkzYw554l5dVS/aPRHarGo22nUmptKw7fjVQNG7Xo
 ceDGIfTtpEpCp+jyMQLjSevRIqf1SzpVG60/YGdyYIxEJ00Ubsq2zqcrpTEEpWMJMkYY
 p8ESrH0zHKZH80zX0Zza+iI1iFFn7baEXk3UHsV0hsH6NFkpzhkxww6E3ng7ElZ27Xcm
 cZJQ==
X-Gm-Message-State: AOAM533W5yGi/bmyGKzs5keqB0sIQvss7KOlf93h1XDiz000fm3mPDL2
 1gVLIAVx+ZVCdM1ubzIRbdq1yk1yTjM=
X-Google-Smtp-Source: ABdhPJxn3ebwGT64KKY3pcR3a1/WYYorY0G+S94Nv9olgAB90WQJj+qAujpY1HMHCOgi9vj3r2AqDg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr10127441wrh.41.1610235887683; 
 Sat, 09 Jan 2021 15:44:47 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id g192sm16852469wme.48.2021.01.09.15.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:44:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Use SIFIVE_U_CPU for
 mc->default_cpu_type
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210109143637.29645-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cc2521ed-9fb7-bd0a-6275-3e90cd6418f6@amsat.org>
Date: Sun, 10 Jan 2021 00:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109143637.29645-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 09 Jan 2021 23:44:53 -0000

On 1/9/21 3:36 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> SIFIVE_U_CPU is conditionally set to SIFIVE_U34 or SIFIVE_U54, hence
> there is no need to use #idef to set the mc->default_cpu_type.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/riscv/sifive_u.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

