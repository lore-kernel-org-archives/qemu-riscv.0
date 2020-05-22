Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQm-0005XP-3s
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQk-0005QO-In
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48389
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQj-00027U-Rr
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XefzKKReH8eZhhydRDilC7RKuHWXd4LHlHsJ6jQQ1Og=;
 b=JDchfoFsuqP6thaWVgmkr9/xC47Pc6xBvbt8abRMj7FtXqqJzPaPc6JATT2QruZFuqa3TY
 kukw7+qqA4oj2YM7bJOGWM33uSgskLUNuVzQ0RukIhbS6rU9TQ/9ZCiE35ya+BP9NBnhR4
 rXiak5XqdSs9OELgNlOyCiZdjg3FmQk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-qcCyBCdaNCOnN0IDqSIPPQ-1; Fri, 22 May 2020 13:25:53 -0400
X-MC-Unique: qcCyBCdaNCOnN0IDqSIPPQ-1
Received: by mail-wm1-f69.google.com with SMTP id b138so1504095wmd.5
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XefzKKReH8eZhhydRDilC7RKuHWXd4LHlHsJ6jQQ1Og=;
 b=s1bXzgnn8JwSm+7Nh7NExz4PX1Pp5/ucj0nh96YkXeNxwIOv1T9LRSopWK0MAs8ImM
 JKAYhBLl3dc0HfgRG2s4gbdq7VRV/z5BFqSdWheW5oD4NFhyGIizTkkptyZqIRl5PB2n
 UMc1zRulH1QMh6yvylzWggQn4xve+TJziDrzi7OwFwfSJ/k9Cr4OiDmjlg0xZqRUBw63
 xqV/u450D3xFKA41bI/slLRXBYl7z36/D26E12rBMeM0kRHJQ6ZE87GGRCxnl+RkdiDJ
 38W3Byr6sTtEa/Is4H8JNbm8F9ExJYw8pppMWNkNSAizd7Xe+p9aGCvvJy3W/a45P0UO
 6ebA==
X-Gm-Message-State: AOAM530dgXZLmvYat+MeSWUzW4av5JNgGO/Qh9yyVLPum92begOIfkQ/
 l3oR7RieepqkjwmDt2axLcT/MYLGJwCSD+bA8h2y1hYsz2mjUVPpF/5ABZ4IO7Ipab59Uj+hq2/
 x6WeZchJN3p+/slY=
X-Received: by 2002:a7b:c750:: with SMTP id w16mr15078729wmk.73.1590168352031; 
 Fri, 22 May 2020 10:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpgj1fIRtXMBFxyv6VxoiRKNc0LOatBF77ySHbAPhKzlIGe3APHYx941CDpkTjoxdNmx5JWg==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr15078719wmk.73.1590168351850; 
 Fri, 22 May 2020 10:25:51 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id z10sm10050615wmi.2.2020.05.22.10.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 08/13] exec: Assert CPU migration is not used on user-only
 build
Date: Fri, 22 May 2020 19:25:05 +0200
Message-Id: <20200522172510.25784-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 10:36:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:25:59 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 5162f0d12f..6dfd314469 100644
--- a/exec.c
+++ b/exec.c
@@ -946,7 +946,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
     qemu_plugin_vcpu_init_hook(cpu);
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd == NULL);
+#else /* !CONFIG_USER_ONLY */
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-- 
2.21.3


