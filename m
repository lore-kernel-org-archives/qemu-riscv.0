Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC95DCA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:29:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCgzf-0004yE-T0; Fri, 02 Oct 2026 13:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgxj-0000IA-27
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xCgxh-0003i4-Ko
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790961739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMimm96Yzckh6J/xjCo++Izm66UFIO5I4/eH3KrRSmI=;
 b=BveknWz1tRK59kV2/MIEOcGgCVJLpmkiXx1tgrSO6U16QXSBRR1D3EN9HyMH4VgFDvIsKE
 Q3bVyaKDw4iKuoKuNC1UfPcEPeJQiHytWRYgLH4dD1MEjHm+KH7yjfxDsiO5fmiPvHptCv
 NsuUXBGceyT6D+NtShXOANTOIkbOJJg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-v8ouDKR6NlSSUtDTyP2BdQ-1; Fri,
 02 Oct 2026 13:22:16 -0400
X-MC-Unique: v8ouDKR6NlSSUtDTyP2BdQ-1
X-Mimecast-MFC-AGG-ID: v8ouDKR6NlSSUtDTyP2BdQ_1790961735
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0C7E21954B20; Fri,  2 Oct 2026 17:22:15 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4027B1956086; Fri,  2 Oct 2026 17:22:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 19/28] hw/misc: mark pvpanic, vmcoreinfo as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-20-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-20-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166128.3025252.2520972277677656810.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=307;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=gLEzL6V1J5mLj97slKrKoYt9+Fjt2KNc7dTNIJXcKgY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gCM0uqO+eCD5hgODJho/LKl0+Oc8OdiGqnu
 tZeQE1P18eJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAgAKCRDa6OEJdZac
 5WOqEACHrLMPQxduSunRW/Ocbo4XsahQZMtVTSyghHJLKVbcCv1NrLJOPp6p/SfsYRmPdP1UMIR
 P1d9PbPfd9ZnmFNlrnqwBDNb/MwJXBh6aARpgS3yi3YNdsLjAyMkD4JVm+kjAJ1/TiiqEjBD3bd
 rypRrS7Z0OLaUyRicvtdUWOmMkiPxF18nZDj6bvTZRved55YurKk9R/KvfIIS/tPcxSSZ+2qF9/
 1giVeuRBGETVMTrykedEcO3m4kwp4xNJU1uCrvFiDmibOk3LU2Sk9gaWkANtP58RDnf7JkorGJY
 ZOwWX4VfmdLgBz4/07vb7uoBBIXD6a/FEk22DDFMPvFh0B690dzudNsQwNE/sdLjtP8NSmjBBbf
 kxixKYZcymykF7VXzRggGlm7ot5+rPTB5/fT277irwXB85698Y/3MyvFrb3c5I5z1c5jEe0WObG
 GpaI6VLTQLZPWZT3hCAwFYgi3Fkq5Ex+YbGaYthHUpctoQRGl1J7U51jidCDP5J1dbudeDNGCWW
 Pnwi/ktgXgxO6prMX7CxXxyNN1YUFOG7e0Ri13BVlkHYUyvTNq7SYRFZWiY8iLuvCdbH7yv6Mhs
 pRhpIWX/OSKOt8XcrczRLyQkxDCop2VPvXxDuNmE2omoxNSdtpXKChvm/Vo9Iaol20ZwUWCHNH7
 kphu3iVgT6cwL+g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 33n1HPCm-RovsJ4cLnYH2N_yGcy9yvfGPOp3Uh84gZY_1790961735
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

On Fri, 11 Sep 2026 15:36:18 +0100, Daniel P. Berrangé <berrange@redhat.com> wrote:
> The first two devices are common debug aids for virtualized
> guests so must be marked secure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


