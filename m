Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVfaP-0003x6-Uj
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 16:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVfaO-0003w6-1N
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:26:36 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVfaM-0005CF-7z
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:26:35 -0500
Received: by mail-pl1-x635.google.com with SMTP id i10so824565plr.9
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677273993;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=x7wVxgcau1DjO9lf37dGwbT86wTbCe9KEdDRaNmXgyc=;
 b=etl3d9mVnvYRzA+RA0TJ9RFo3F2YQDIO0+rGCtzzvYf/VQe5Ys9blgTYtgKOdyqiS8
 mYgVqSZFvoHHH1ps3dykviIbmjP/H22ro+cU0kn9zuMk++GLTnMflCYhGX+wxZKJ6i9c
 ++F+E357rPFyOxyKvOtcAVmNFyYlb0JuLTZTHL2JIxPsiN7ifQhPBUccBBxx+SOA9/RL
 g0pau3sw4bdVurEQ/OEWSUFsluiCoavr2ypONTUcJK2GcLSwygXGm23/qhJoTGv9TbjN
 95gnWvG1bzeyeeVt1eAUZofY4Cms9o8fJ66Noo1M6C5uE/vq2ZeatKmilh8hdEVEWIxG
 ssMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677273993;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7wVxgcau1DjO9lf37dGwbT86wTbCe9KEdDRaNmXgyc=;
 b=GB4k3s4QrsI5eeDV8yxyv9n2T2yryHtKXZpwrwebxxDqPDRgBg6TmmRMB1wlZ+r9mF
 QRwx0G1Pv8FsV8yBZ02skIHokR8qfO/AzTYQEuR8IyjO3D/DgK6PzTZJcaefannP9UQn
 ce2qvz+vx0d5nUy/op6Pd1LxtDn2SdDlD+941Y0YKuF6QCHoHZzpAY2PwYKrGgN/8pkq
 ARot2Lx9F86b2YQ/GG8ih0OxYK/v3WV3SP+6VxckrRBolHtQH/YrCQ3xOnF/fj9TWRb3
 xvia7nlrm/snEvEsnI0ZsDAfaLw9whlKXmNHaVNVpMnhevfThxbPUN24+A0Y4nUU3xxg
 saEg==
X-Gm-Message-State: AO0yUKUKF3zeh2uv1X1KP0OpuR0urMsfKBlMdpH6Q9+IGZQ7mRABBaQk
 Wi6hADQpBQ3jXzijxJ0CZ5yxrA==
X-Google-Smtp-Source: AK7set/8w5OWFxKjI7EitKlyMKmz30LJWy22+idoIj1UJrM/iJjJtT6iWo3xWRn+yGHKO5B1GczPig==
X-Received: by 2002:a17:903:2304:b0:19a:a673:4ee2 with SMTP id
 d4-20020a170903230400b0019aa6734ee2mr16077539plh.31.1677273992836; 
 Fri, 24 Feb 2023 13:26:32 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e10-20020a170902744a00b0019948184c33sm11014471plt.243.2023.02.24.13.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 13:26:32 -0800 (PST)
Subject: [PATCH 0/2] Fix the OpenSBI CI job and bump to v1.2
Date: Fri, 24 Feb 2023 13:25:41 -0800
Message-Id: <20230224212543.20462-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,          qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>, thuth@redhat.com
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 21:26:36 -0000

The OpenSBI version bump found a CI failure, which appears to actually
have been related to the Docker version as opposed to the Ubuntu
version -- at least assuming my local CI run
<https://gitlab.com/palmer-dabbelt/qemu/-/jobs/3832389705> is accurate
(thanks to Thomas for pointing out how to get those set up).

I've left off the Ubuntu version upgrade because it's triggering some
key-related issues when in apt.  That's probably worth doing, but I
figured it'd be better to send these along now to try and get things
unblocked.  The EDK2 Docker setup looks like it would have the same
issue but I'll also keep that independent.



