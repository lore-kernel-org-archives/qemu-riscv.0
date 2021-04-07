Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU9Ao-0008Ky-Ug
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9Am-0008Fb-Dy; Wed, 07 Apr 2021 10:28:48 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9Ak-0002QB-SD; Wed, 07 Apr 2021 10:28:48 -0400
Received: by mail-yb1-xb33.google.com with SMTP id e188so9311857ybb.13;
 Wed, 07 Apr 2021 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EaV7rz4JsYEf+mP4RzS8Raj5XII4Ko3ch6vrMNY9HaU=;
 b=C0KZls/bbjhw86DRa5BHfONzZ9z55suHpmSry3EyJ/DMWH9zO51VjPL8LdHMlpMlAw
 068esu7vfNqypDMq3f7C5mcVLqm0//SkAOc78Qzeo+ywcSwoODlh5i8ammdteqexUndf
 4BmCbs0kzVZKOeH1iv/XFouF3ALiMM2RxZVwNMJE2ASN2WAw0FidLssEGDEAY7trnmN8
 mv6/Rh4kVl9MwiPtGpwIurq9u9NE7Hfb8zv0XaiTWR4dSWPvSq+E0hP4pRxm74uDv+gH
 yiqaFzzD3lWUhVsv7y5GOsv+mBmctAmTyHxrg0Dbhoz5omsRc26+soD+4t9EcTp6IWYi
 1H+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EaV7rz4JsYEf+mP4RzS8Raj5XII4Ko3ch6vrMNY9HaU=;
 b=pNLsQ9wYLJLK6U6na1vJmpP+s4NVG8/zilpKT0ujBk8sxloDbJRJ7aJZP072wUVRKk
 0j2f6bcn6BlEzXsEkYavzb5NviF4HRAb6LCm39px0DCa72rlfZFbXR6ld2ZWHnn0s8hZ
 Bm/VNepSNrZCBQbgJ9UMtREcbSb2nlHo5s+1Ma3OSNojuBKXiS/Rw52cJWTdUB7BL+80
 ZW/WEbTpNsLKnTR+gpTASjcS9M2Ug64UD4tlTixEuQjhsRZR6PqyYRal3EJrHSOMZL9U
 bTZhLiluDGQHnuqjEjcF0grg7XNCzlf+U+e1GiAZQ1a1XvbALVha5nZrceb+HMAbWDaT
 bWfg==
X-Gm-Message-State: AOAM533CfPrOQ7KVcU5I1ZlbeanJiWN7opyL9n2UdIkpknv2Zp3Kn+Ys
 7DZIIUtJSyN0goNC+wAl9PWAvh7TUNxMn8g4OfA=
X-Google-Smtp-Source: ABdhPJyzMe+T6U5tzES464TsvOkKADTmgP5tlEQK1jsAcYexmt8LulHQBTFjVBHBG+iVWukwjyFGHkO60Db8HqJ4hhc=
X-Received: by 2002:a25:cfcf:: with SMTP id f198mr5051737ybg.152.1617805725677; 
 Wed, 07 Apr 2021 07:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <89188d4b3d72aa1dbcd696c6489a39d84ef8cd2e.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <89188d4b3d72aa1dbcd696c6489a39d84ef8cd2e.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 22:28:34 +0800
Message-ID: <CAEUhbmXCNB+-Cqjm6WsvSFrjxxZJBNx7UCxfYLxSP0eihQSqoA@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] target/riscv: Add a config option for ePMP
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:28:48 -0000

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> Add a config option to enable experimental support for ePMP. This
> is disabled by default and can be enabled with 'x-epmp=true'.
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Message-Id: <SG2PR02MB263458D195A60A57C05EBE9993450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h |  1 +
>  target/riscv/cpu.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

