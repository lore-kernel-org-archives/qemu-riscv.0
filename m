Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyhPQ-0008Ni-SG
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 18:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyhPI-0008Ll-Fp; Tue, 07 Jun 2022 18:10:38 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:35609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyhPG-0005xM-On; Tue, 07 Jun 2022 18:10:36 -0400
Received: by mail-oi1-x22d.google.com with SMTP id h188so25773090oia.2;
 Tue, 07 Jun 2022 15:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=od9CPu0KQJvt1whmshMNSXWlsqPt54sDgWq1/kdLM98=;
 b=BOYbaGM48zQeLQ2ibCUz15uyG2gqFN0HCmGnuhIHltPRF5VHsbsT4jce2ylAcwSgQm
 mMYX64qFwy3BGxrUtUMtkpeJNGZnygRS/K0KvOJL74477j0eaX5yht8THFkw3TMW5uME
 jqdeupARjLdKJr8EJ1GWkzRiWn0brOgK/B7qLjypJM0irj617ZidO+gUd3O1lCa/zP94
 CAj6P5AK9z9bDbrGBIFNmcq6yjcuOVvExfwZKmSwa8sAY7EX3WN1IuNXzUDDPsXbxvN6
 j89Sab9PLIvtVe/pFHlZKXydbkNwpOJhNVdtX+Gl39iY3Jei+QEBKdv1mXCCQ70S2DUv
 Hbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=od9CPu0KQJvt1whmshMNSXWlsqPt54sDgWq1/kdLM98=;
 b=VUnRFkfIhiZOSk23bnsJJdz2hUFNxjhbWj47wyceGkg/4zLzaY7VNo+CJU9DAaKat4
 nIhl8arXa/dewdkv9v3XZYUML/ZiY8cJpiPJeQYNviuNhDZ5eguHSCFu8GwD2hsAtDcv
 HU3V5HRexiS9S/KKLnU4nudIGYP1GaVZrDgWZ8VZ4YlsiJxCD4DV23uGNvu1z9USpUyu
 Pu1HcO0Ah9Pvkt2HPury2kpiSeBGjpknu5lk40QAohcSGKodaSkIYWm1zUVWq+lZgFqh
 u13yBvXuVip9LY29hnKNnoWJ3PzXhrrFYSNtTae4iDK4c+tmVION0+NWLLB8je5VgejT
 GmCw==
X-Gm-Message-State: AOAM530Wbn9j5qTa6NGNh+K8P2FrO9pAc9AZGxbKfEEftOvr56dPwPd8
 1jJ1i4n83gN+FXXrDpXbEft86ZqmOv2TEbtUveU=
X-Google-Smtp-Source: ABdhPJwbCWYXQ0g3Q3gYBanP3y9LtAv1yJ6L5uyFX3QtUkbJt9ppgm3tm5PpEWlbyM4jUk/2kk7iCM/0oVGtFM1bjSM=
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr644935oiw.278.1654639833221; Tue, 07
 Jun 2022 15:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220601013657.197358-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jun 2022 08:10:07 +1000
Message-ID: <CAKmqyKMTq_KVt=m0Z7BtqueXJa=KJvrVWBVNEh3i-rbhy27GXg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Don't expose the CPU properties on names
 CPUs
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 07 Jun 2022 22:10:38 -0000

On Wed, Jun 1, 2022 at 11:37 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> There are currently two types of RISC-V CPUs:
>  - Generic CPUs (base or any) that allow complete custimisation
>  - "Named" CPUs that match existing hardware
>
> Users can use the base CPUs to custimise the extensions that they want, for
> example -cpu rv64,v=true.
>
> We originally exposed these as part of the named CPUs as well, but that was
> by accident.
>
> Exposing the CPU properties to named CPUs means that we accidently
> enable extensinos that don't exist on the CPUs by default. For example
> the SiFive E CPU currently support the zba extension, which is a bug.
>
> This patch instead only expose the CPU extensions to the generic CPUs.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Any thoughts?

Alistair

