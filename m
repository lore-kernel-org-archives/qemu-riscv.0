Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0978CCA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:23:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCgyX-00015S-QT; Fri, 02 Oct 2026 13:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgwt-0008J4-Hv
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgws-0003Ql-6I
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790961689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9atV6F91Np3AJSP8EvR9BlLmhXqze/BVTWs/nALyZU=;
 b=c4gMq0K68zqPsWljQdnSONnrhN4yII1eqRzEDJeQE9sgN9CZ1LBhPWJXFccfnl1YqfaNWy
 lOBeiXdc9KLgrlXo04RJOmrMPF8uQ4i0HoRGTycqIfwwrdM2mOPKY4i186EXt3Yws66Xoq
 MnVwBnMPuLVw69BS3Z0HlJn2RFerL3s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-fWtsDnO_NtCHrdxiJGM9zQ-1; Fri,
 02 Oct 2026 13:21:26 -0400
X-MC-Unique: fWtsDnO_NtCHrdxiJGM9zQ-1
X-Mimecast-MFC-AGG-ID: fWtsDnO_NtCHrdxiJGM9zQ_1790961685
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CF881180214A; Fri,  2 Oct 2026 17:21:24 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0EBE730000E4; Fri,  2 Oct 2026 17:21:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 04/28] hw: mark all virtio CCW devices as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-5-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-5-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166111.3025252.12203965466791871761.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=309;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=PSekII06o7zCWPWy2CIE3EZ+vXhRl/0UxFggYHWlhX4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gB2ziSadzcbnREqwHWphh15NhfRLxCk9+vE
 SuLWNZ0Mf6JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5Ve0EACSyl/3CG+IloIAgLWy3FSQZfjdogFSHHxqk8man2cyhdeL096tEALwnJzEnLKE5qo3Kbs
 zPuaLS3sr7Y/T7ucAtlrcy9a4wBH8NIUQvCx/Hb+MeO8dfUMkmcGNHPkiULa0oPpZH5OcrQ9TB2
 7PkzrFpE1aaR0fyMPVxHkjuRZMi3OOAOegVRWUYhxXSLN4/HuIxb3s5A9qcv3fHKMaYmJJzhKfb
 BbGt66SR9vP15051I0Jli+FVqrqdC6BC/ikUvdVWWHDg7rXcsYm6P5UeiKn0vfoHYyTIEZDlhOz
 gF87qL2Bg1V2xkWIaQL5fPgH+qS+k+WPrN5MKA2JbUQrQ0WKF96DpjBDm1Vnf3TsJ920a3hKqM1
 28wsvdlc7HCCtpU1Vyy6TFQ3o8jGdYpv6fWX7CuJeh8AkyN658Nk7qvhaJpxPw8j4+DSgX/OxGO
 qhFj5usmW3RnsRl/wire5q7CUpb7EQh+ZOWvEMAooWGoZeAc10WddMrI6yKH6J6tQPvUvagYR3Y
 cV46JF9vWI6eC17Hxl5EjlusaiIOHPYhrA7nW7mPjfWeZ2Rz8/ZjYJzM4BDTRets7skDfN5fjQN
 RjPTmxeF1jexsrBb26XNA1rnR8SjXOTM9rzMk9oRicwRbuXQLMLbjN8VzWtrJHa4c/xo4nHSxaA
 xMDuq2tMdOy6tfQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: rsd_Pg3fi_LqC6g6irne0VEr2FtPwTKy6fBvS0xdeuA_1790961685
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

On Fri, 11 Sep 2026 15:36:03 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> These are all intended for use in a virtualization scenario and must
> provide a security boundary.

Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


