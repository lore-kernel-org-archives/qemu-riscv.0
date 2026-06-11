Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED4CD98C6
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 04:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXWwn-0004SA-DQ; Thu, 11 Jun 2026 00:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXWwm-0004Rb-4x
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 00:23:16 -0400
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXWwk-0005Mh-GL
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 00:23:15 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 21C681400077;
 Thu, 11 Jun 2026 00:23:12 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 00:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1781151792; x=1781238192; bh=4oslrsk7DFnE+Z0O/BogOb/s5IfDBs8z
 +CGYxF5h/jk=; b=WLa/tBu9yGA5BH28H1QzoRRtm//xWT7bRq4smpkhwr0BPT+h
 5sgGkAWJwK0fN/8yRHqY2H0OX0ZB3bD7DXgYn4cBJUa9A+7m/lGCoaRegvZDGfIu
 VEYiK/U2c0f9yvAq4BxVkmhdwuvPBpXbcxRzdDZ2gB37nt11+queHF8jHHTRR/om
 k8vHA183C66In+7ugJbEeKVaXT+n99wINjyFLluw0yiMCj6lZEyNZf31U2z8TPCP
 K2FQBCVVWP1p+ZWNWHhyOtLuq7JWwk5iA83Vi3UaBKZfArshhORsmh42v57shXr0
 /mFe24ksyIlgTWl7UgoISY69kTJg2jk47PiGIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781151792; x=
 1781238192; bh=4oslrsk7DFnE+Z0O/BogOb/s5IfDBs8z+CGYxF5h/jk=; b=W
 kaO6GHbw16SnXKlmcyB99afMnVuviilC9+Ptn2SZYkv80eaV0IFCS4U5ayrnRh20
 wZGbLOKJkavJ4WL6Ewh9P6x7rLZYG6hn3fQidpm6kPph4r1iE+9RCIEd1Vc2RiJO
 Z4K/58e/63rRp63gDqSCQJqg6fFCuyZk3YeAIlgLVEgjTCYbTZgw04eFQUEN8wVB
 7L5ITGsKp7dEeK96A38J9xmcVff59ddjjL9kEVDMSZYiNqtO2tK3Wf3GrapIcJr9
 XIa+wD1r/REmen9LBYEk0Ar3H//WoSRjxDYeP7vLXdIGvYbexRFN8XN5qda9B7IS
 M70SBh8UxdrqaZC0YbL+g==
X-ME-Sender: <xms:LzgqanO5zql3OLIxRtF8C5bxA9VAUGm4gkoHjW3C3JNJvVuQKdju8g>
 <xme:LzgqaswbNZPYqiDaZSsXNeXnWlRu2-vsry8VHGvPr_VKNtKnncGWwCLuqXHJ7Y7Hu
 OVJod4_0c_wQ7pcc0-x96foPXZUz50Ohi48ArX7sOgnOyC9vQg6nw>
X-ME-Proxy-Cause: dmFkZTGEC2Tu+zdtWNaof55SN/CZJnr5HPlnUL3suQ4wm20l4mVo0YmvhVzYd2xTkSrai1
 HGwQtLC/ZB3YtQKOjGGuF8oTGoAHGWaOPaim1esrTJlJPakFaGGa0Ncw8gh2eptop0Plda
 2ijIdVlj0Vo/0lLhKLUPqiHxi2Uywcw//eoOo3KjcxooSGva1OMyinWUQflwIL4jdaUuP5
 9QfWrYKk7x8yKANtfaI3YdAcGjomwUN8TNu+V0M5FsCulaKRTIUZ0UZYrJWdsFwUK7TLmT
 wyFbKVEUPb9lXuZ8PVcBU6GaY3OUd5PHMozpGF9o7T71oUdupZNT3zrfVA3QGOFSxjLFYu
 vg3kUXK4/qx9dzScRtSE83b59+z5mZDIxrvumbg/6Del9P8zCY+0RXvY0LscYbVyahSvdL
 mkyPis/fhlQefQ/uy1z+a+Ueqi94F9yTfY7GyCPtu8EUSOXW7m+9Q9Ky7i2w40aE49yuWn
 zlw3/4WFOnEcMKRdYnyHofP9ogXIHeVvmzOoWsgOSGlo4gU0c+6BZ5LmosYKCdnXXkYv/G
 BcF8r+htqBZMQnVzv7ViIrmLj3uw0ga93pyM8ocIzjoGD5+z7pagLp9hpV12fP5EPIpXE+
 0DDPSrHOVRFFRhnSSgpiYNVkKTSYOj1PWqZkcXAyrKLHrV0OnXyag1ZFJhXw
X-ME-Proxy: <xmx:LzgqauuriklJM5HpCExccy4c3FJZWN1qw5jNEYkamEE_uVPkYK_Irg>
 <xmx:LzgqavdS3A39GjFVdkU3M3rvk67c7JDjnMyQbCSDKwfjWu28kU3CZQ>
 <xmx:Lzgqar-N0AnivS1Nqe3SsGm0il9_9lrUQJHagci9X56Sq5RGjICTeg>
 <xmx:LzgqaqTU7Q1NwN0fWyPmQxKeBTrm_1uTqlww0l-apEPvBMLaUi_JTw>
 <xmx:MDgqaqGsTTosYSBKQxM6iDRPWPQl1UDj_g27psqNTzz1JewNbsfMtIVY>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 46B562400098; Thu, 11 Jun 2026 00:23:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 14:22:50 +1000
From: Alistair <alistair@alistair23.me>
To: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 qemu-riscv@nongnu.org, max.chou@sifive.com, mikey@neuling.org
Message-Id: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
Subject: Regular QEMU RISC-V Call
Content-Type: multipart/alternative;
 boundary=f253d97086e35e4c3833182d228c32ed77ba7726
Received-SPF: pass client-ip=103.168.172.154;
 envelope-from=alistair@alistair23.me; helo=fhigh-a3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--f253d97086e35e4c3833182d228c32ed77ba7726
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello everyone,

As we discussed last time we should setup a reoccurring meeting for QEMU RISC-V. The current plan is to start next week and then occur once every month.

For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.

If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.

Alistair

--f253d97086e35e4c3833182d228c32ed77ba7726
Content-Type: text/html
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head><title></title></head><body><div>Hello everyone,</div><div><br></div><div>As we discussed last time we should setup a reoccurring meeting for QEMU RISC-V. The current plan is to start next week and then occur once every month.</div><div><br></div><div>For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.</div><div><br></div><div>If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.</div><div><br></div><div id="sig95865080"><div class="signature">Alistair</div></div><div><br></div></body></html>
--f253d97086e35e4c3833182d228c32ed77ba7726--

