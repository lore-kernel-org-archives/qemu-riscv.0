Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUl3T-0004F3-94
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 03:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUl3R-0004ET-Rf; Mon, 27 Sep 2021 03:28:01 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUl3P-0008OQ-M2; Mon, 27 Sep 2021 03:28:01 -0400
Received: by mail-yb1-xb32.google.com with SMTP id u32so1136008ybd.9;
 Mon, 27 Sep 2021 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6NWL0PIE78YTECkSs9hvPfO0IgJGuXRCUlSiVP9pcI=;
 b=EEulhOMnb23dk5YDVXjyHisxXkDLcaR77aZ4Sdbw23lsoLsqIlJdbbk9u0SbAt0Mwx
 I/pimJEP6N1+IECLRsemkeTk/wf+k9BH0lUhxpwAFspydHVG2duneOxBl0Oc6YshEOn6
 ulj6AfPvUFs1egzVrqBnggchjDhKNO58d633jkyiklIfUR3/hWShCoGcyz7fnpQd2sGs
 aib59H15NrpGi6ggraxkJ/2YOKQeBQVb2K3u4VEDdIDeVpg8iaEUJfby5l82Bq5YOdE7
 HUNl+zWvjl51QtBoA80QnNDR2L8DTAjRYcEhbTZPvC1LkaUVFoegvRR0t48DB6iIm67R
 gTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6NWL0PIE78YTECkSs9hvPfO0IgJGuXRCUlSiVP9pcI=;
 b=NrRWql5nyvK+Hfvn6uT/YBpOX/wStgCBMB675pwq+vDD2JK3IqwyAf4Fjtulen7kSo
 t5NREGiZO4Uv7qKDcj/sEB8YzItq6tGaewWJHr7jaH0k7ZDKQduCW5RvTq2O+iNyWiXR
 yPR/ZisU1omrxJ5QlCL0RWDV+dPTQHjbhCe2frOxPclMMY5eHRvYvYmYm3k4cmM0fbhP
 jy9XO75pbnt9zDbcDf2ROYwH1GDywBsnnvvHybNoEf+qVh5gdp77rCR125X6s+oGuMcA
 mxSANVarhr0/D9a5YCQSbxDoWGMy4xjouycs4ikEyeCHb4BC6+maWzzescYQNccmOTd5
 uLCw==
X-Gm-Message-State: AOAM532UA+wZwR2GItNJK9w5CMlHxL/Qq7qTGcsfGCnE+cCXf4DxTEnZ
 8arC7IhOkN6/rFiABQOvsoebMA4z0IvPVihWuXo=
X-Google-Smtp-Source: ABdhPJwCPeelV9Ag10nIXWUrSpXU8BxHCqIq7z88gXmdOHHqUm8p8xL+Uvfm74uXQb7NOw+fyQn6GYq/KSSFeTVY5oQ=
X-Received: by 2002:a05:6902:70b:: with SMTP id
 k11mr29467964ybt.313.1632727678450; 
 Mon, 27 Sep 2021 00:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
In-Reply-To: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 15:27:47 +0800
Message-ID: <CAEUhbmV8XkWRxZxKPxQbr8J27PP1EZxR2yZYHkWgV16fxK-ZOg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv: shakti_c: Mark as not user creatable
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Sep 2021 07:28:02 -0000

On Mon, Sep 27, 2021 at 3:13 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Mark the shakti_c machine as not user creatable as it uses serial_hd.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/shakti_c.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

