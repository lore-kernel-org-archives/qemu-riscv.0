Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6627AC5DF87
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 13:26:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx2lD-0001hC-P6; Thu, 20 Aug 2026 09:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wx2l9-0001d4-7g
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wx2l7-0003Tm-RI
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787232280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xASrCA785D17ICsVguNfnjhAWKHDnXfk0MzDidAK/4=;
 b=JJFIMgFgATVOCaSFxampx3Zz329YVD23HqY3h7PVdcr/S6j/Zo0hXBW2NQrGhuoq/0SL86
 g2hQITL6Uf2YPKELOGbkTqpptjyzmD6YIkBetncQAEgC2l1mYbugoo0Iv0Dhi+/6HpSF9R
 D4XjiXp27MBOsYrrmVKDkO8QAmoW4SU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-AVS7vbZNM0eKr1aeNknVQA-1; Thu,
 20 Aug 2026 09:24:37 -0400
X-MC-Unique: AVS7vbZNM0eKr1aeNknVQA-1
X-Mimecast-MFC-AGG-ID: AVS7vbZNM0eKr1aeNknVQA_1787232275
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E34F1955BCE; Thu, 20 Aug 2026 13:24:35 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ED6233002D29; Thu, 20 Aug 2026 13:24:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 08/13] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>
In-Reply-To: <20260820104730.25462-9-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-9-philmd@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 17:22:15 +0400
Message-Id: <178723213510.2730041.16865044633915045684.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=315;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=uvfkGJioctHHo2E1Ajjz+M3tgSzWRsy3mbVHFsKR2CQ=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqhv/qJLrxMoqnoHqTMyHnuJqL9SujJX+9UFyxX
 QYfbC040aWJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaob/6gAKCRDa6OEJdZac
 5UrgEACQy1bc5yHq7a2HaAEIKWtVB2UlYn6z/xTpcp7cr4UDBGxys36NliuWzXxQ7cHb2xnpdKd
 njaNfDep0vw+ATGOlbSVlwFAZKlHyXyObw4NNBw1B0HJX9rRsMquHTTsrIfOiU3SpFN53oz9q5B
 kE1WTqtY2MYH/+DQUHvEtk9YAT+KHgiHo3Q6OY3ToNk/UhkUPKiAbcCxBsC0sZaeN4vrOIUapKp
 InbfhudJiD69O+HjqgjNkitxw7glt4x9B8fPcXqFsPPb1OO2dbvv8rP9S4sj581Ei9PKItlooqV
 TbzARgv1L3bnMy/guLjdwriQRtTa2dFDhH7hc/KNKmSelowSSMH3MZNk8sMGnK+Ba3cNnM/BAJ4
 bBGuzbrjlZicXQIWBHEW58ABd3Q8QGr1HhbrDVs18/YQDye6WZenZ9/8GLqzAzGkQT49ZGEPGhW
 PBRSslpwYAgpQMg3XTANSSNAyeTHB64E1odiXEOlo6wUbj0pgDoPQvd/5LYLRqGNwIBxr87QE84
 HMq1URltVQOsmxUArW7lkTMdDi85bQpPtxjQtwCPN50FNPlyt75MDFKvfkIbo/gr26cLlJULS4o
 HBtSY/0ooFPvqqu4Y9DNcvxFbZGufMf3bHW1Bt1syHzjMVazF2iiqglwm4Om/8+gilDJbUpdEpH
 jWZcglK1ltiABYQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: kSO87nNeWCTaX79aFnqIPb7hC6XbnDRTx-wQaideEzg_1787232275
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
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

On Thu, 20 Aug 2026 12:47:24 +0200, Philippe Mathieu-Daudé <philmd@oss.qualcomm.com> wrote:
> Add the const qualifier to CPUSPARCState when
> the argument is accessed without modification.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


