Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352F9CA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCgyf-0001Ti-D4; Fri, 02 Oct 2026 13:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgx6-0008QH-NX
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgx5-0003VN-B0
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790961702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gECulURY/oZLI9VNqz+HsEt2goE7of/WCgXwCZCLckM=;
 b=h44U1fig+5ZZBe4Pb5Xn+WGfpd/dhEGKYUTvQs85Gna9P2P6m7ze8dzMhVrorFF6uOY7oA
 Yn82sHGKJJ3kxWzEVa1Sut+mQWQtcysoUtb2R66y7u9QA6A5slhZhoIXLaZJ9UDIFoz8Sc
 ThwfDrOnn/Lk/6/OCxyjYjE6vIP5e9s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-zFRBNzENMlSchus4DwaXww-1; Fri,
 02 Oct 2026 13:21:39 -0400
X-MC-Unique: zFRBNzENMlSchus4DwaXww-1
X-Mimecast-MFC-AGG-ID: zFRBNzENMlSchus4DwaXww_1790961698
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 511EC1809CAD; Fri,  2 Oct 2026 17:21:38 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7A772195604B; Fri,  2 Oct 2026 17:21:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 08/28] hw/xen: mark all Xen related object types as
 being secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-9-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-9-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166116.3025252.12679898543529528318.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=339;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=7Vh5I2mhOnROAfcJUHuBXxYpyiWOJEXNCmbxX6t9bCY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBlYEWUugjEw6F6RwUrtgnjToRRUxqe8oo2
 Q/lqXVuxcWJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5TSxEACo+euuTcDsNdOhlOuR3cJnM5my1i4aCmSDh7lQJC/ynM5fFU9cvMkrJYZXwuxJotzfTGn
 j6F/MeecnSWsV5TEDRogTUiiaEzjz0tqrslPESywfke4fGNjoR0QqZxPw1p+7UutESlyLUnxqm6
 oHuaSh2dkq+zlmbeTPlmrupj9aR5I28x7Ee9rE8AITrGi34FcmraSX9YpugU+aFTVunrMAPQ064
 WRaxTzZlwl5qQExuKoHME+eAeP+6NX9BJYC494ELwsA2UXxwaCnrGCpsONM7S5pFXuZsBNrf0gi
 3Yx+iOaZ0nKx3FkRCHujrIBmKYF4e2wE29QgI5TCmij8tH5utnBBtI9ZpLWnnXX8tLIMsR1Qv+D
 fxnS+3DaCMEGPduPx90ddj4tEwdnTnUIGlQHloSM4o9oj2ejOPlRr9/nxytuKazl1am8qXOYsQ6
 ljDOvfH5oGRqTIOTbhA5Gq8AKTSw8P/sjM0YHpMplHCXPRJvx65KGW2w3sW80SDsOdxRkbdMbYZ
 tlWoiauNcXYZHw2KXghWw3xOIXatzxw4t/nUIdhSFdaTeeFp2lpo6O/dYu+Q1xcMcoNdyNVBGpV
 3xAKjczkE4s+jhoQtxsfbeZ5dZk4RwLy86IuI5T/aGL6ZXJw28LkC9tkYYYl6/piLx8bzcC/IgP
 cDB1t40DWiIRptQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: gOYewQwUT4eq3QTW53vt9x9XKbqbXSsptPT5CV7EYkg_1790961698
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.336,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 11 Sep 2026 15:36:07 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> All Xen paravirtualized devices are intended to provide a host /
> guest security barrier, so mark all Xen object types as scure.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


