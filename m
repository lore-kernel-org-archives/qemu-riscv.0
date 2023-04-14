Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnHiH-0007GR-Ud
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 07:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pnHiG-0007GB-EP
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 07:35:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pnHi9-0000bV-M8
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 07:35:31 -0400
Received: by mail-pl1-x62d.google.com with SMTP id o2so17998546plg.4
 for <qemu-riscv@nongnu.org>; Fri, 14 Apr 2023 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681472122; x=1684064122; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ySBcuZypoziLPK0p5hxwoKlDPQeOUnGrVPv85DNllNo=;
 b=sOUVJJsoDJpg4VD9SCnDMIbun5loZXsxGcMmRkv0y2jz2QfB3IKPZtKbfS2rRaFD6A
 5p41wXPnIP5jbfhUhgWYq9WjC03LQ3XtR1WN0wF/8RCSIZV3ufxJn7YIG6ko5dJ0G6a+
 jqhOzHg5AgsTnYV/jFfODuWv1SbXs77zBXMi2rcOAzKcMjGv5/E8xRr3Zf3AKuQpvoAy
 oqbW4yfx5fUfseOp8CAxoDSi9fjKX+xYfdMDCX7lkOmVO4hhJTuuRTxiIg5P+axiXUMM
 Zh9DTAhx+FSsi+IfajYDL+nMuJUIi/Z9OJZPHeD/JaU2xvHF+bBZ7Bwt28GLQ193htBT
 mMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472122; x=1684064122;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySBcuZypoziLPK0p5hxwoKlDPQeOUnGrVPv85DNllNo=;
 b=itkQV6QwX/ZItx2/lgBKoq8Qe4TUxqDGh737GMa8Yeh+G9N52g9TvL8udUWq86fwuZ
 crwxuo+lVkHTPO7T/VOWDhBF3tbuud3ZPTzgFMdKBljTEauRtg0dIXuxQCTq6qNL++5n
 EK2BtxEEnLk25PWD8uU+tsoYQi7JeRjVw6Je7S0FenJUlKJ7qj28jQyDcO3xDBoF31ti
 uD4hep72on1UuMUsMoTjD89EJZ+m0qSy1kvHKgLqGM6dFyr+PeAFSGUXUTDXFpha01aw
 mxYf9t29Lm9zYoC1LAxWRBeD9/R1FHnr//gBcKuAqwrVDqCcbGaf0+bwYz+rxOJR1pmq
 UGmQ==
X-Gm-Message-State: AAQBX9eF+3OaNG7YxcYALa0FLH4Syz0CrR8GcL3V85loBkXWy3MQw7gt
 ICm3TaSNvQBmuVEEn2LiJtMnjH4ij0HUsXQiFhtj+ZPxJOpwCXRD56U=
X-Google-Smtp-Source: AKy350bQiYBlk5jS3RpUIn2lqxPP4TsPCP1GWgjLL1zYT92e1P/MbhPPGQpv/2exZyrdx6IrTvz7i4WDSrmayCHmiAE=
X-Received: by 2002:a17:90b:38d:b0:23f:35c8:895 with SMTP id
 ga13-20020a17090b038d00b0023f35c80895mr5008569pjb.32.1681472122203; Fri, 14
 Apr 2023 04:35:22 -0700 (PDT)
MIME-Version: 1.0
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 14 Apr 2023 12:35:11 +0100
Message-ID: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
Subject: KVM QEMU AIA support for RISCV guests
To: qemu-riscv@nongnu.org, anup@brainfault.org, alistair.francis@wdc.com, 
 Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Apr 2023 11:35:32 -0000

Hi All,

I am starting to work on KVM-QEMU AIA support for RISCV guests to extend
kvm accel support added in [0]. This is just to confirm if anyone else
is actively
working on it to avoid duplicate effort.

[0]: https://lists.nongnu.org/archive/html/qemu-riscv/2021-08/msg00117.html

Thanks,
Rajnesh

