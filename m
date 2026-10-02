Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A5FCA5FE0
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:24:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCgzK-0002vL-EM; Fri, 02 Oct 2026 13:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgx0-0008NG-Nv
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgwy-0003TK-9r
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790961695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQzmbhzGyk0iOML82lQWr2IfcBKcOLgEId1IHR9dGqw=;
 b=KU/DD20dxXYKGoWZ/YS5G9bdThPGXW1KC2ID+nCzm7ga+L6wu2pxqNI05ro2cGA9MmM30e
 Tdb3jbmTlg8nuKzRppg7kT+HjSnX8MVjEm93CvzsQ6X3d8Dvy4pRblPZ/jjdOv7PX3ek2E
 1UJoUNtIhdGqLE1viuZbLhBfGMHrk40=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-6sk8FPqCPEWpIN_3l9tEDQ-1; Fri,
 02 Oct 2026 13:21:32 -0400
X-MC-Unique: 6sk8FPqCPEWpIN_3l9tEDQ-1
X-Mimecast-MFC-AGG-ID: 6sk8FPqCPEWpIN_3l9tEDQ_1790961691
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 70F1A197838F; Fri,  2 Oct 2026 17:21:31 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A3AFA1956086; Fri,  2 Oct 2026 17:21:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 06/28] hw: mark all remaining virtio object types as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-7-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-7-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166114.3025252.16977253754744941880.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=sxCkKp/ZMUyqes3eitE1tZzksOwuJ5PON2jVXe0dusE=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBjW/Atw0+zWBXIkienYKY3LmqFlBm9Dx8y
 dyfJ48xnZuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5S9tD/sEWlPdG00zqA/z/61RRB3Sn1bjGpyDXIwPxKPbcvpU/kaWDhYR81SloAp2WBOiV0PYMmS
 xavQ10ku81T00U7EmG3WIZO3T1tBMxOFrpvhUE2fhWQ0pRmMreNX8/ujG4SQfs22Sk+UHXNBt/Z
 hMQgXljQ+GeMJ9L1NDKnw2a4uRtB08Mt2Q6tPztTvQQYh2/dqDiF9jVnmgYSBTTBENtQ2sFFWSO
 7MbQVI3zdMXPqy62Hg/h6X9U2Lt2zHSpO/TYy9EcEQB8bE8z8otFED4VljZkNHaNBeZ5sa8Xysd
 sTYPYvM5pLDlxVL8HmxUQqD6/eHm8AJ86K0iSZkc0y0BkGEHijkBNGkiRRT6bQFMRQTN1n7NEy8
 If7oWMNI3jfoTSFmsv8bfDWcLdZxKGp5Sd1RL8z6dSByd8/ljY36coZ/QdFEPvVK0nahj+Zglsk
 4gvdRXS1WTDw+fGXrhxfmG1btfoyDaAGcPDR2A9eNy29AYTbzfCor+sc3/uE43peUhqdxWlfL51
 gPlZ/OjNoEU99NhbeF2L5nP6mQPjFj7H055zgFfb+xxeyNIafKLXweW60MlOR/Lqe/fZJFE17DY
 VhwqhppvR2yv64Cd91I2St6IQ18UEZDAOhzWS6lmHigsMOoDVsm5w7PkxtHvd+H7Ga9lYUIscFz
 ULpbpv9yzMo80GA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: y-G2H7jBEnoFk5WVM1sIMiyo3sJ3mlegBMo4xpgSA80_1790961691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.336,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, 11 Sep 2026 15:36:05 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


