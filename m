Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz6eC-0006PS-Jg
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e6-0006K7-Is; Wed, 08 Jun 2022 21:07:34 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e5-0003ve-4P; Wed, 08 Jun 2022 21:07:34 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 15so19790550pfy.3;
 Wed, 08 Jun 2022 18:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=23Xs9Kakr4ozVjNYfk+AhDByJanSyoxp2JVmeFDxRww=;
 b=EZ995C9w7zBxMytuAGNm2bIBairnndbM//VnlF0GO+mhTDkq88GiOtDpIhWIA+Zd6k
 ugPEe+1vsV491AIEAC85nGDjrWppq8YyDj2CAtPhX7NkQqWOC0gez3E1omSPsknSfuHG
 N1tHDrGVv3ziZyHTkzXkTbe0Ky9I9JO44eALlDYAuycRLdcWudLUiOfODyso0tWb/s9U
 rQSMus1Bzzq/n9P9B0K0vP8QJ410NzV8hZxUPpCQq5G61uCi99bLAq7GDTOAbrl9e+Gq
 M0mhPJN1J5qCxr2I9jVuwW6hQMPtvuWpTlQ8MvICPgKSJeJdQuD9CDi8xf9Fv/Ud2geB
 SzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=23Xs9Kakr4ozVjNYfk+AhDByJanSyoxp2JVmeFDxRww=;
 b=M3/uLtzBw6eR0o6tzP4y92zsWxfwNNM9TQW9X75Vw2gFjft8pmzx3OnopxIe1OvfGE
 3ztnNl49yeMEvmqNsgZboL4ZBnTkblB288h8qOneiJGJyjl9TBnp2bCRpG8ZTsx3+42u
 7W+AtxQNdMqfw46RZrNc14bChg/bam4RI39RGH+mOSc2EziATpYvAdbxs6N/kUIHuwIb
 372MF0OVfW494aWjQB/77SjNKGz04TbdrLzvTDENkIY4A+wydI3rN6z7RLSPP/sodARk
 LW3N9b305lPaUuFOxw/NxWX2Jf/ICM9L+mUOmTybKMOHnekfpkOFkfYfyxZtSs+DoZAy
 QeVQ==
X-Gm-Message-State: AOAM533v//8kTol4tIZw05hz7TuZNgy5b+pa7j5Txbi9jCsZ8C3HA8FD
 MoXwmDkOp3hbLANcUWt1FA12cKVpPBw=
X-Google-Smtp-Source: ABdhPJyB4c3d39lrSZ2nsvq1TkytlCShq4eSKvw1gSHtfFhg08YOAY57ZzdWSaBRvaQDtTpoT/B4WA==
X-Received: by 2002:a63:cd04:0:b0:3fa:1e2e:9720 with SMTP id
 i4-20020a63cd04000000b003fa1e2e9720mr31852104pgg.179.1654736851539; 
 Wed, 08 Jun 2022 18:07:31 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902f15500b001640e9f638esm15283402plb.51.2022.06.08.18.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 18:07:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 3/3] target/riscv: Skip parsing extensions from properties for
 KVM
Date: Thu,  9 Jun 2022 09:07:24 +0800
Message-Id: <20220609010724.104033-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609010724.104033-1-bmeng.cn@gmail.com>
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Thu, 09 Jun 2022 01:07:35 -0000

When running with accel=kvm, the extensions are actually told by
KVM, so let's skip the parsing logic from properties for KVM.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 61d1737741..ff911017c3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -581,8 +581,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
     assert(env->misa_mxl_max == env->misa_mxl);
 
-    /* If only MISA_EXT is unset for misa, then set it from properties */
-    if (env->misa_ext == 0) {
+    /*
+     * If only MISA_EXT is unset for misa, then set it from properties.
+     * For KVM, misa is told by KVM so properties are ignored.
+     */
+    if (!kvm_enabled() && env->misa_ext == 0) {
         uint32_t ext = 0;
 
         /* Do some ISA extension error checking */
-- 
2.34.1


