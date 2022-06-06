Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny5vI-0006K9-Qf
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ny5vF-0006Ds-Sr; Mon, 06 Jun 2022 02:09:05 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ny5vE-000810-AA; Mon, 06 Jun 2022 02:09:05 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id v22so23930150ybd.5;
 Sun, 05 Jun 2022 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tsF8j92tBgEYuzZRVUNRM/+yH9oTlIZ3cgz2OH+EhVg=;
 b=morD0BBIsiON67srPOaIoMojIRPelbzxH6QK5+hXCSPJQZrFX2f+M1sw2LQwXUnU9P
 q7S0FFwAU5EbqVOCpVW5+2PrqwoiqFnF/1z27O2w6B0mYckk0M3smx2QKhSa/iDZgkLF
 h0cz5h+CWCyM0FQPg9n0ZI0ssa0JPqp2whRAJ5fibGrTFfC578kA4efRbLvakbMs3YuX
 LkyJv2Jmf9x/Bx4dMFcn94JxH1sxK/pJs7G1fl44MoHju2ZeLAF3aHPXZLnarRKEbDqi
 ZRn9msNGVlvU5xaLzOOEk4Cv8RJOhtftkrDYeV+2MEKPqg/jjGH4BI6xMJ1QYt/VIBJd
 V62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tsF8j92tBgEYuzZRVUNRM/+yH9oTlIZ3cgz2OH+EhVg=;
 b=5fHmt8hnIVSlEwb6qxeOgVmpCBu67zj2VULLgXxvNA4EKCpcm2Vb/fgWpt6H5lPLnd
 HqraagG1rDVcInDApeZ4oMPx5tmOtvKGOeDGSSQBusfp6ko+MloWzY5OX3YRA1XDJprR
 YUN7tpaG+ItqfPlbRyJE8DRzOnZ/bqk7F68R6FHO0C9snalS3qCYT3N0ChvwUCg87xdD
 t/WiT7pvh5gN2+ckxQphQjG38H4QuDSk5aj+7FUBNPspJ9DL3bHiLzt3HjjX8VkpXaLr
 KL5ZSnlg0Crys1451osiIIbJlbl76NM8swlM+6mJj9fOH5czTD9dZgiY6ZhligpCKZID
 haEA==
X-Gm-Message-State: AOAM530lnZ4j/lXkR8fcNhfkU/YhK8ZJbHKq1pXRDpKGs3ukK9BAQMbK
 jNMimDW0qpoC6Wdt+DGzHZH/7xP5JxbMAmi/m3E=
X-Google-Smtp-Source: ABdhPJwd91cdhoMHKuUIMiYDsjUUW2oAUlYTNv+hs8XXohChOvwH6O4lQ7dGPd3MggYoPnzFTJuJ4Xeip/g3UXOPoiQ=
X-Received: by 2002:a25:ba46:0:b0:64f:e0f5:11b3 with SMTP id
 z6-20020a25ba46000000b0064fe0f511b3mr23020048ybj.643.1654495742709; Sun, 05
 Jun 2022 23:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Jun 2022 14:08:51 +0800
Message-ID: <CAEUhbmUyO=j_1a3-N6nQ5ReEJ_FRb2=Oth=tMsrWxUy1o+_NnQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/debug.c: keep experimental rv128 support
 working
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Jun 2022 06:09:06 -0000

On Thu, Jun 2, 2022 at 11:55 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Add an MXL_RV128 case in two switches so that no error is triggered when
> using the -cpu x-rv128 option.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> ---
>  target/riscv/debug.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

