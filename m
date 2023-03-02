Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYkB-0000jD-Dr
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYk9-0000id-O1
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:32:29 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYk8-00048Y-1D
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:32:29 -0500
Received: by mail-pl1-x633.google.com with SMTP id v11so12578546plz.8
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 18:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677724343;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4UXPLfpRXeWjtHYgrdOgFIZrsGiUoZWchmtMXfPGG8c=;
 b=IL/bGjuFZC9b0Xk9YPFfc+nN1m90jXc3pi6ZdwL0vLxhatUoPVxskcRU9wJQ2YvN8S
 K0hJE261SKHZjdUWG6pcv1ppl29XqdpjujsxdLUKaOcbo43DWb4H8e5hIyk/FBu+YQOQ
 66+oNIM3VWnHofiNBYUIFZJxt3hwPHpVucXwX9enwTbu2KinbKydo8mNpPig9iW67Mzf
 LiXYjMkyg71EsFXgrCj4t2YVFfrFas8yRQSz02JAqr4lJZhlJDuly0nl5S6pC0pA+/bj
 glR9wIuj2OB3MtvS3PMy0yc6QIdu4kNS6UnKfIy/uaNVe4dWh+GujFXN64/X6lZSbYdB
 mThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677724343;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UXPLfpRXeWjtHYgrdOgFIZrsGiUoZWchmtMXfPGG8c=;
 b=TIt7RmuoN2fmrTG81MyuG92crPuzcUnZGe5g/oRuLuvAijDeFHuzSDW7LYRWD6kKeb
 9lr0WZXVz1ycrfxT1tNwOBLLB99MiBUte+koJUu4IXMf7Oyt+fXQ7VoLmjCMpdL2a8w8
 Yy2i4dh5yUGS7hp9Z/fOZoTLaLdKQFTVVco2MDuDRYN6TFGOy7ZCfVJo0/GDEAWP+NhP
 75ohAkc3JypFi5qKQdIKmP14u6I4YcGED1gY6xM55J9wW2PvT5kbIQRTrW41Mo0bc5Ob
 yMG5RIeVPKc83EbC6qkZB/68TcSLLVX6Om7+dWKwq7MT15Pwl/h4JNTYsRYRu4rIAAre
 rRAQ==
X-Gm-Message-State: AO0yUKX8Wlam+7RljSes+GthOh1jURk3SxWB1PcdA9pxpjjegN7W7EQm
 GHmlueMgBAhiHjKRlwGaUOayWA==
X-Google-Smtp-Source: AK7set9p37ChMJm/kUFLyfdRNshfthkNrkZtk9KDMZBunaTX5iNoPg9NB9DBX4OpUSHFuvdrxK4dYA==
X-Received: by 2002:a17:903:2448:b0:19c:d78b:cdc with SMTP id
 l8-20020a170903244800b0019cd78b0cdcmr10193347pls.5.1677724343370; 
 Wed, 01 Mar 2023 18:32:23 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c5-20020a6566c5000000b00503000f0492sm1755765pgw.14.2023.03.01.18.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 18:32:22 -0800 (PST)
Date: Wed, 01 Mar 2023 18:32:22 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:31:21 PST (-0800)
Subject: Re: [PATCH 0/2] Fix the OpenSBI CI job and bump to v1.2
In-Reply-To: <20230224212543.20462-1-palmer@rivosinc.com>
CC: Bin Meng <bmeng.cn@gmail.com>, thuth@redhat.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Message-ID: <mhng-33fa8014-8db8-44e5-85d9-f2071db025ac@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:32:29 -0000

On Fri, 24 Feb 2023 13:25:41 PST (-0800), Palmer Dabbelt wrote:
> The OpenSBI version bump found a CI failure, which appears to actually
> have been related to the Docker version as opposed to the Ubuntu
> version -- at least assuming my local CI run
> <https://gitlab.com/palmer-dabbelt/qemu/-/jobs/3832389705> is accurate
> (thanks to Thomas for pointing out how to get those set up).
>
> I've left off the Ubuntu version upgrade because it's triggering some
> key-related issues when in apt.  That's probably worth doing, but I
> figured it'd be better to send these along now to try and get things
> unblocked.  The EDK2 Docker setup looks like it would have the same
> issue but I'll also keep that independent.

This is queued.

