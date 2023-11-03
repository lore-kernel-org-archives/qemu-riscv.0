Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61917C0018A
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuWT-000358-2a; Fri, 03 Nov 2023 09:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuWN-0002wG-F3
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:35 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuWA-000108-9f
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:35 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5a7c08b7744so24412927b3.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699019241; x=1699624041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54Kf0rAoudsnnoVt4nlQX6I3ltS6TlxVzrnjj9HiVnE=;
 b=N5Cw0RNdslJlj7copgGjvG0+xXV2996I3urrUv7hqEIkP41itfkr647XS7IeAIED9j
 EgxQBRrJfcxsMwNL//3dm9Egun+kIHhXygv1ikwQsgSD8P4l62jDosUGQkETI3CuTZjo
 a+JJlhLKVbmQQs2laRLzKz3e5SWulxR2NRvrTvn5lTdWrNEYIIkoAF8p8V90Y42fCrUH
 LKMop0j1KjCbavyDrp++32pSskfRvEGzC5Rh6UuIAzEkrJMUxI4umJpIyKh4agsWhmlA
 dbXsV4FTvjec3evf2ADb34zKgzVuhlumRlgNJZsxORpmv/TBWwgKqVc4HJiXh0EqF5yv
 WUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699019241; x=1699624041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54Kf0rAoudsnnoVt4nlQX6I3ltS6TlxVzrnjj9HiVnE=;
 b=qMAUnepIIqglVtjg2VUiMnzNH8LeW0uetHR/LhL92k0lkcjJUAuMjnul3cfxglXM98
 0K5fwEV6f19FMkhtOdSZYHRh8EzSGJzvbKSBOVdnkLtbnf0Hr2w51bhBLsUSHLy8WBsW
 riBjk0P+cJXInAjJdBxvBDy1EwaD7YcpDvHimfAZXegPq6rBKF2PlrH5ZbhpF/Lt2wlC
 vPtWztCwo8NDuqj1W3oTDh3OyJ/GxwFTDNpOdxmu9Q2cbk/agyL6DRMVH+OQ3fc1CWJC
 NyGUUEHfaEnqAICOKxasyn2wRSd9znV+RTOND9Qyrr2oHHaorRtlJKfTNdt8fDCM7C7b
 LwTQ==
X-Gm-Message-State: AOJu0Yzm0wmabecAdPzCq69frCnHmhVVP1NSaTUQRyQP1uO5qDB6qZrf
 eTG5eRJ/ixir1AIuhHQHAQmCUA==
X-Google-Smtp-Source: AGHT+IFnqo4oVoO6J/s8Fwr1CagPJDk7Dj5w4nxC/1Npak0Evk5BlmsbeFzWonuSwJhkyJLypMWu/g==
X-Received: by 2002:a0d:db49:0:b0:5b3:26e1:320d with SMTP id
 d70-20020a0ddb49000000b005b326e1320dmr2836275ywe.40.1699019241241; 
 Fri, 03 Nov 2023 06:47:21 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0df947000000b00582b239674esm935814ywf.129.2023.11.03.06.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:47:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 17/18] riscv-qmp-cmds.c: add profile flags in
 cpu-model-expansion
Date: Fri,  3 Nov 2023 10:46:28 -0300
Message-ID: <20231103134629.561732-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103134629.561732-1-dbarboza@ventanamicro.com>
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Expose all profile flags for all CPUs when executing
query-cpu-model-expansion. This will allow callers to quickly determine
if a certain profile is implemented by a given CPU. This includes vendor
CPUs - the fact that they don't have profile user flags doesn't mean
that they don't implement the profile.

After this change it's possible to quickly determine if our stock CPUs
implement the existing rva22u64 profile. Here's a few examples:

 $ ./build/qemu-system-riscv64 -S -M virt -display none
-qmp tcp:localhost:1234,server,wait=off

 $ ./scripts/qmp/qmp-shell localhost:1234
Welcome to the QMP low-level shell!
Connected to QEMU 8.1.50

- As expected, the 'max' CPU implements the rva22u64 profile.

(QEMU) query-cpu-model-expansion type=full model={"name":"max"}
    {"return": {"model":
        {"name": "rv64", "props": {... "rva22u64": true, ...}}}}

- rv64 is missing "zba", "zbb", "zbs", "zkt" and "zfhmin":

query-cpu-model-expansion type=full model={"name":"rv64"}
    {"return": {"model":
        {"name": "rv64", "props": {... "rva22u64": false, ...}}}}

query-cpu-model-expansion type=full model={"name":"rv64",
    "props":{"zba":true,"zbb":true,"zbs":true,"zkt":true,"zfhmin":true}}
    {"return": {"model":
        {"name": "rv64", "props": {... "rva22u64": true, ...}}}}

We have no vendor CPUs that supports rva22u64 (veyron-v1 is the closest
- it is missing just 'zkt').

In short, aside from the 'max' CPU, we have no CPUs that supports
rva22u64 by default.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/riscv-qmp-cmds.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 5ada279776..205aaabeb9 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -116,6 +116,19 @@ static void riscv_obj_add_named_feats_qdict(Object *obj, QDict *qdict_out)
     }
 }
 
+static void riscv_obj_add_profiles_qdict(Object *obj, QDict *qdict_out)
+{
+    RISCVCPUProfile *profile;
+    QObject *value;
+
+    for (int i = 0; riscv_profiles[i] != NULL; i++) {
+        profile = riscv_profiles[i];
+        value = QOBJECT(qbool_from_bool(profile->enabled));
+
+        qdict_put_obj(qdict_out, profile->name, value);
+    }
+}
+
 static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
                                            const QDict *qdict_in,
                                            Error **errp)
@@ -220,6 +233,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_exts);
     riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
     riscv_obj_add_named_feats_qdict(obj, qdict_out);
+    riscv_obj_add_profiles_qdict(obj, qdict_out);
 
     /* Add our CPU boolean options too */
     riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
-- 
2.41.0


