Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62194606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g9W+X9Qu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJqVE-0004PY-1r; Thu, 22 Oct 2026 06:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xJqUk-00041Z-5t
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 06:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xJqUh-0001f6-I9
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 06:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792666678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf1uAvBr+TOzyyC/cJUBpO+hKl+CKbQl10wlm+NkPLI=;
 b=g9W+X9QuSLpPMj0QZmZn6xDYxW/8gxhvFr1YQtW7h2DB9n0PYM9L67EJCshAyP/4+bRjes
 UIfzbYEZxDf2U1m8SwC10mgabVV+DkuuKqbM8TbsRySDOo8jB9m8dEoUr7gfLhzkvAwMso
 G1sshl17g/CbRGHZZusMBjs9cD0J9k4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-t5Df2F50OpeSQkP49wFYcw-1; Thu,
 22 Oct 2026 10:57:43 +0000
X-MC-Unique: t5Df2F50OpeSQkP49wFYcw-1
X-Mimecast-MFC-AGG-ID: t5Df2F50OpeSQkP49wFYcw_1792666660
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 826731955F19; Thu, 22 Oct 2026 10:57:40 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EEC7230000E7; Thu, 22 Oct 2026 10:57:38 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Thu, 22 Oct 2026 14:56:42 +0400
Subject: [PATCH v3 15/18] target/riscv: bypass smstateen check in debugger mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-query-reg-v3-15-7ad902b9a7cf@redhat.com>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
In-Reply-To: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=R3a+prp+zeV/o8jeRFp8UnHm/Hx+5w7OVq0NUuTjw9c=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBq2evmvC7gr6jO+CwYuPVco15wLqRbEX/2nUugj
 at3ybu6C9yJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCatnr5gAKCRDa6OEJdZac
 5Vq9D/9Kqbp0Z9HSRzMVRWsBnZ4jSxwHMZK2Ok6MD+FGxQE+r8sExxHcgxoPoKhCtLKVeFvEto4
 4oBbzFOVpoXkrjgHspeViHHTjbKHf/exWNSjRT0iuxikxAsHwo87VPYAMEgzz+FQcne0Db8T8Ei
 NT2xMll3AC3gBbJ8UuPMfByc8dYamnXBq089jBwBhvS8LNPQ2FoJVAARg8JOjhTBbVJnNgEqS+8
 kblKN6eI1I4RU25M+qLV0awt1Zw2mhsqt1KV82mAh6fBf7V4pakSdXnonkYkT84awehF9HO3YOU
 YqW8vK6p0WvwjbBLQi1uqjSLwTgxXSR41Ly+t/TOd9jkNhNLWWehDPLTzc+KIEhvnN2XCnf8RC5
 mYGWDcpbesZQrlkFOYqAQYECKIg7zbe3PwiIKmLwqzyJYeclp8Na1oukeFgYW+EaTMPFU3QNuU3
 CZMgOSR9h6QyW5ZUYB4j6BTsHguojctu0y6T9c5oQu9d7QIEHIJMe2LNH3gBEGhnwrphwozWmiW
 /+IQGyHK8MYyj+Hx2F4USknOIh8ZTnaTrqlLCqfxkUYZikIBml9KbB8M/TbW+dO+BQxz4khcckL
 eW78/hM9OEfODA1qwbciTmfaXD6XU2p60VpLHG9yeiwdH55WDFXA0ot3Ua78cgRCvBadml11JEw
 8geJ3xrfMD0PYXA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Jm-wf2Em5dRuLf-1-JJqpHdzw9iJkA43ldGs8uHMhXQ_1792666660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow to read CSRs gated by Smstateen extension when env->debugger.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/tcg/csr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 063590f56a79..aff5b54d37b1 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -53,7 +53,8 @@ RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit)
 {
     bool virt = env->virt_enabled;
 
-    if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
+    if (env->debugger || env->priv == PRV_M ||
+        !riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_NONE;
     }
 

-- 
2.56.0.116.g6de20f6092dc


