Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOalR-0004ZH-1H
	for mharc-qemu-riscv@gnu.org; Fri, 10 Sep 2021 03:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOalI-0004Ud-6a; Fri, 10 Sep 2021 03:15:48 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOalG-0003tz-MU; Fri, 10 Sep 2021 03:15:47 -0400
Received: by mail-yb1-xb29.google.com with SMTP id c206so1852366ybb.12;
 Fri, 10 Sep 2021 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NeK+eKYxdQTx2iCLotbl02qs/H73l0GWylR2Sno3/0E=;
 b=XPRhd7SdJSsFmYj0FSemUMMsou6qJg2j0SDMgKLHd+kmzKXHOmBl+Rc1oxbnPXNhJa
 UKuhsBnA7OhkCHJbzTrVn+JuMPfvhoJ3ImtOpGeVzJrIywbxGNWC8e0LuqtnT6CLgiYE
 fztKVfkn1tbjdCCz+ZbONzmbYNk7jAInjwElzXFQEGdJVdngJvLYl5su3Yufo1L5yl/Q
 F4dGI2GzmdJPXYILIhddyMRhD16JxpyJX8Bufg56RmG328LAM4TJaf2Zcdo4gAR9+Zjb
 G9/xSx5a9mE/vzNh6gmOnHb0RhJlxfNxC2ngCTkejhhOd+RGR3sMqT2EdwhQhSFmhVLC
 nyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeK+eKYxdQTx2iCLotbl02qs/H73l0GWylR2Sno3/0E=;
 b=I9tEM4XWGtXA5Zfwx2tu7hItNR4HRGOzNjLe6hI/+V4kupQvU6HsOnLvk7aJ6CnrVg
 5ath5k++nqGsoq35ZkJvLC5cMQJDkHebVxia3jIkbhzGliJe/zKSriYIkH4JgBC2APdh
 UF9puK8ZVqQ2XeuFt59CVOLxLlXH5WIvVTcqzWY+ZtTAFXvoTzAkpTNYskogMzc4mTN/
 C3Nzs+FV46/Cvn5Lz7C3qQMdK1LCxVHAtNGYrmG70lSCbRrFegN/XPX8GXRoJUqZTb77
 qWCSDeg58ScbdQD9GFmhj0PPrFgcJ6qXhQEkmfc+tP0C4Ro895YyM8Dg8Zs+2YIa7lhv
 Xz2A==
X-Gm-Message-State: AOAM531gn9yXbXRC3heZksKs5rnm1tC/ajH04KvJ606GI4Jsu2ZXPUV9
 yRauNUF4CIEpJB10yID347WqCc/kqLWj3wxRZFlW/A0An5o=
X-Google-Smtp-Source: ABdhPJzLNvxVZVdDacqtCUixXq8uJ0zeT01cr2H5abRMSTOvZUjH16D78MqN0nAPRQpMEiXe7biQMYNVw+MRDsKrXJU=
X-Received: by 2002:a25:2e42:: with SMTP id b2mr9238914ybn.313.1631258143463; 
 Fri, 10 Sep 2021 00:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
 <20210909190033.1339448-2-space.monkey.delivers@gmail.com>
In-Reply-To: <20210909190033.1339448-2-space.monkey.delivers@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Sep 2021 15:15:31 +0800
Message-ID: <CAEUhbmXvN7XBBNGGi_bREBFDauNTmhCZu64-BVqn46TmEcg8VQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] [RISCV_PM] Add J-extension into RISC-V
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Fri, 10 Sep 2021 07:15:48 -0000

On Fri, Sep 10, 2021 at 3:00 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

