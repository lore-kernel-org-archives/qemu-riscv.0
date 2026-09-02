Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DB7C624D0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 04:44:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1coM-00006U-0H; Wed, 02 Sep 2026 00:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1coK-00005r-NX
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 00:42:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1coJ-0000Jv-6d
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 00:42:56 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KTg4f3849612
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 04:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=; b=hsXDBVyCG5hqKBrE
 zrJg4OoGnjC1NDKzjryifJov0CmbXV/DQirTRcTvSuZLJeeCq209Yo4JVpvL7KCO
 9J0HocrHSnOi1I0CVoo/EJy3VPQxY4JBS9bI3HJxg2E34+MB/czk2R2Rxc6WPrxU
 EXG3sP4bvYF+x4egjYNh0LML96F3j3UyO4wNmY5u6HkUijNS9le7SafsN5Hczlko
 fyEz+ZZf1It8mrHfCgDRhNRogQ+mu7+O68Fdocf97ta3grSTQTQc5xhzkDFYX0ze
 sE630gnrQ0d7vP37vLmSrXamWE+J67PeCWdSd+Jh/x724jNODOAAMndeRuRL2doa
 pJNVcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0t4q0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 04:42:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cc1bbd7d6e6so731421a12.3
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 21:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788324170; x=1788928970; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=;
 b=e46sFtKK0Z3eJh7IMs/BdubzLqczZcUH5mK8/pLbgG+UW75trNAsSRMJBYmzb6M1sf
 haQeuJ6FOl2nyMHVoINsNy6nYEeioOQGXp0BQxCMtur6W4AXFeA+JGVtFYk3mutD0Wzh
 2rXRAacPISL4pUd6NZeSAn2WkbkKGZtY78KVK7y+NJ5xTjVVRA7oyi4HmoFroMGdtnbJ
 eVFwrhDATPPGsY6I8EZgBT5X6HA4FpDMz+BokFGggtrwGtRfkQiqRjL+4lIcNsHtBY4j
 mfQ0dUCKLkrCc/PjZbN8TWwWE5gAgbXQSxWK+ElU6UsvQvqvq3mAO7VxGtwyxQeos12L
 y3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788324170; x=1788928970;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=duQyVDjHvCwWfJ8/fDnqIo03r/fNqO+pyLmoWy36RGE=;
 b=JKVRneBGuh2NzMVrbsoSx2iVdoeNx/h5a9m6RJcTAxG/ZtjSKuL/AOhyDxeUQan5dR
 gA8YJMnWqWGzWyWhJmHPYRZTpOo1kANAQ5S9JlRS4n34RXjv7eHWcEN5gdgRNcCbSxaW
 L0LxkMfApHrS0wQjkY94RxPcWVctSEdExnDWA+4nxJ0InHOARE/3xdyabI8+1YYj3qX/
 3Q6aIO+eC0wpYahuNUxoeJ49UK0oU1Sqa4EQ2ayPa9BD1p2S8MBh8+zTEQ0xjthzvmPx
 7KZCsT2CZcrOWV/ZX1D3z7hAUvm+HdTWdHE+4I4kl5UBJm+92cUGzffAcowDAoqtgXgt
 MoZA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5SvmEq7KgzVjtaDc8sH4fS9LZIETyG5QnVJjshRRScAiW58ItDHwpd+M4dYvR5q8fSRGV0oX0M+hU@nongnu.org
X-Gm-Message-State: AFuF++khQ/Tvopz3OGoTR1uMLgpNGw2TV41I9UGZSDQEAsD2iBNxwTkH
 f68zKczGbPJLAd0bCh4mu4g5rix4A2XZZdkkq76oB5Z6jJTp9AAEtfZXGeP2cayKx9aFe3JSQmQ
 APr6MXeix0E+nxO6b7HVcFmQpcNTKH7OvGegR/tfXbEIFvJp8Pqhup3Y7/Q==
X-Gm-Gg: AR+sD12gFA/UjkAmxH7cxau5UdptFypccLZYwEwbVx9te0WvK5zXXUCmtZg0NHkYMfo
 lxuc5UnBdlRZQxhrs+nquK4U2EDBgdvDB417lVNpQ8ha4Sd1UPp6xXBVA2M5+7U80fjWQm/e0l5
 C7s7WWNO+hP/6yjCVZ6WTYix23oksQuByf03kgOXZAzHcMCmT+tLU9BYKfW7M8O6NxBSwIMhhYL
 qupHMp7djDOSuXV4HEmJjS4lFnlhJOWisnzybrlL3cVBO2D15F+wtDW7TykOVtQ5w34M9VQ6jOs
 ZKEvFYY5a0cOZqi9dbYQADgOP7ANZTw/TmD/bts+GI2/KCy+TRKM+3p7iEHCC34wKm4LVOqEOtC
 W3UJgPKbVbUj2ZZiaMwJ39mKPeKn0Nvca8h5NQDKkF3yemNhQ
X-Received: by 2002:a05:6a20:9392:b0:3d3:ae1f:d7f5 with SMTP id
 adf61e73a8af0-3d9afe1762emr3031891637.21.1788324170378; 
 Tue, 01 Sep 2026 21:42:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:9392:b0:3d3:ae1f:d7f5 with SMTP id
 adf61e73a8af0-3d9afe1762emr3031847637.21.1788324169936; 
 Tue, 01 Sep 2026 21:42:49 -0700 (PDT)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-32f079c33e9sm2933984eec.4.2026.09.01.21.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 21:42:49 -0700 (PDT)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: qemu-devel@nongnu.org, richard.henderson@linaro.org
Cc: brian.cain@oss.qualcomm.com,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 06/28] semihosting: add callback to set error
Date: Tue,  1 Sep 2026 21:42:09 -0700
Message-Id: <20260902044231.843004-7-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902044231.843004-1-brian.cain@oss.qualcomm.com>
References: <20260902044231.843004-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MCBTYWx0ZWRfXxofFsJcQ1tgL
 iUfzURn9Uf0IwHJxZLascC9k+IpXG0McfyCCo2OHDud2dVhSGrW7pKqQkt5K6ohPVw59DlKzDNq
 eS604s9+x40obPs1CrRrN0mOfJpIvKyGo9s8TqXT7tvA/KHgdDtGm2lddAmjT9qTPfdnpXCXO8j
 wfg/CmtPa7EgIeRjF8sK3yc2KS+NqluvGSvX9WVkgtoHwEeZp1jeL0n76Y/oJF+dCeHX/ls0jNs
 I6x53VDOzXN+zXieKSmSWgZVt6sqyRC9ujQPjIuKUwDXYFyNWJ2uWQ1fllgSTsVRih+6jEOQt5N
 AiJ8balprC1iW+IaeOrgvtOVMDXi2iToO6FEz36dl3e8KFbV4E78xPCyvh3KxODewyEw/vKloaX
 Ype+eR2OXHzn0/8UFDacXI2RodeyDBm9x5VBUTEpjdUQN7iH46gMGGXpRlfOusHidi6QY8rHReX
 B4gNNt9kiT3+dDi2+Cw==
X-Proofpoint-GUID: S7vx8jmV-b9RtdNKVycMFibT5tQm_hPq
X-Proofpoint-ORIG-GUID: S7vx8jmV-b9RtdNKVycMFibT5tQm_hPq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MCBTYWx0ZWRfX5ro9VGZMPoSv
 j7OD0PTQcs3Mcx+WCQMDf3OZOgxx2kTn448NXot5ydc9YVi2yUnxUMmLcXMwhsPW11E10+sXioI
 miEeMzpFqyEyIb5x6zyWjy83f8Oo0TE=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97a94b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8ndNYmkutmpv_8xOvXsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020040
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPG1hdGhldXMuYmVybmFyZGlub0Bvc3Mu
cXVhbGNvbW0uY29tPgoKVGhpcyBpcyBjdXJyZW50bHkgdW51c2VkIGJ5IGV4aXN0aW5nIHNlbWlo
b3N0aW5nIHRhcmdldHMsIGJ1dCBpdCB3aWxsIGJlCnVzZWQgYnkgaGV4YWdvbiBpbiB0aGUgZm9s
bG93aW5nIGNvbW1pdC4KClJldmlld2VkLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGFu
aWVsLmJhcmJvemFAb3NzLnF1YWxjb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0aGV1cyBUYXZh
cmVzIEJlcm5hcmRpbm8gPG1hdGhldXMuYmVybmFyZGlub0Bvc3MucXVhbGNvbW0uY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBCcmlhbiBDYWluIDxicmlhbi5jYWluQG9zcy5xdWFsY29tbS5jb20+Ci0tLQog
aW5jbHVkZS9zZW1paG9zdGluZy9jb21tb24tc2VtaS5oIHwgMSArCiBzZW1paG9zdGluZy9hcm0t
Y29tcGF0LXNlbWkuYyAgICAgfCAxICsKIHRhcmdldC9hcm0vY29tbW9uLXNlbWktdGFyZ2V0LmMg
ICB8IDQgKysrKwogdGFyZ2V0L3Jpc2N2L2NvbW1vbi1zZW1pLXRhcmdldC5jIHwgNCArKysrCiA0
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Nl
bWlob3N0aW5nL2NvbW1vbi1zZW1pLmggYi9pbmNsdWRlL3NlbWlob3N0aW5nL2NvbW1vbi1zZW1p
LmgKaW5kZXggYWE1MTFhNDZmNDIuLmExMTkwNWVmNGVmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3Nl
bWlob3N0aW5nL2NvbW1vbi1zZW1pLmgKKysrIGIvaW5jbHVkZS9zZW1paG9zdGluZy9jb21tb24t
c2VtaS5oCkBAIC0zNyw2ICszNyw3IEBACiB2b2lkIGRvX2NvbW1vbl9zZW1paG9zdGluZyhDUFVT
dGF0ZSAqY3MpOwogdWludDY0X3QgY29tbW9uX3NlbWlfYXJnKENQVVN0YXRlICpjcywgaW50IGFy
Z25vKTsKIHZvaWQgY29tbW9uX3NlbWlfc2V0X3JldChDUFVTdGF0ZSAqY3MsIHVpbnQ2NF90IHJl
dCk7Cit2b2lkIGNvbW1vbl9zZW1pX3NldF9lcnIoQ1BVU3RhdGUgKmNzLCBpbnQgZXJyKTsKIGJv
b2wgaXNfNjRiaXRfc2VtaWhvc3RpbmcoQ1BVQXJjaFN0YXRlICplbnYpOwogYm9vbCBjb21tb25f
c2VtaV9zeXNfZXhpdF9pc19leHRlbmRlZChDUFVTdGF0ZSAqY3MpOwogdWludDY0X3QgY29tbW9u
X3NlbWlfc3RhY2tfYm90dG9tKENQVVN0YXRlICpjcyk7CmRpZmYgLS1naXQgYS9zZW1paG9zdGlu
Zy9hcm0tY29tcGF0LXNlbWkuYyBiL3NlbWlob3N0aW5nL2FybS1jb21wYXQtc2VtaS5jCmluZGV4
IDVlNWYxODFiOTA4Li5jNTQ3NTNmNjk2ZiAxMDA2NDQKLS0tIGEvc2VtaWhvc3RpbmcvYXJtLWNv
bXBhdC1zZW1pLmMKKysrIGIvc2VtaWhvc3RpbmcvYXJtLWNvbXBhdC1zZW1pLmMKQEAgLTIzNyw2
ICsyMzcsNyBAQCBzdGF0aWMgdm9pZCBjb21tb25fc2VtaV9jYihDUFVTdGF0ZSAqY3MsIHVpbnQ2
NF90IHJldCwgaW50IGVycikKICAgICAgICAgdHMtPnN3aV9lcnJubyA9IGVycjsKICNlbHNlCiAg
ICAgICAgIHN5c2NhbGxfZXJyID0gZXJyOworICAgICAgICBjb21tb25fc2VtaV9zZXRfZXJyKGNz
LCBlcnIpOwogI2VuZGlmCiAgICAgfQogICAgIGNvbW1vbl9zZW1pX3NldF9yZXQoY3MsIHJldCk7
CmRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NvbW1vbi1zZW1pLXRhcmdldC5jIGIvdGFyZ2V0L2Fy
bS9jb21tb24tc2VtaS10YXJnZXQuYwppbmRleCAyYjc3Y2U5YzE3Yi4uMzhkNTJkZWIzZDYgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9hcm0vY29tbW9uLXNlbWktdGFyZ2V0LmMKKysrIGIvdGFyZ2V0L2Fy
bS9jb21tb24tc2VtaS10YXJnZXQuYwpAQCAtMzQsNiArMzQsMTAgQEAgdm9pZCBjb21tb25fc2Vt
aV9zZXRfcmV0KENQVVN0YXRlICpjcywgdWludDY0X3QgcmV0KQogICAgIH0KIH0KIAordm9pZCBj
b21tb25fc2VtaV9zZXRfZXJyKENQVVN0YXRlICpjcywgaW50IGVycikKK3sKK30KKwogYm9vbCBj
b21tb25fc2VtaV9zeXNfZXhpdF9pc19leHRlbmRlZChDUFVTdGF0ZSAqY3MpCiB7CiAgICAgcmV0
dXJuIGlzX2E2NChjcHVfZW52KGNzKSk7CmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY29tbW9u
LXNlbWktdGFyZ2V0LmMgYi90YXJnZXQvcmlzY3YvY29tbW9uLXNlbWktdGFyZ2V0LmMKaW5kZXgg
YWVhZWI4OGQ1MzYuLjM4YTAwZTE2MGMzIDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY29tbW9u
LXNlbWktdGFyZ2V0LmMKKysrIGIvdGFyZ2V0L3Jpc2N2L2NvbW1vbi1zZW1pLXRhcmdldC5jCkBA
IC0yNiw2ICsyNiwxMCBAQCB2b2lkIGNvbW1vbl9zZW1pX3NldF9yZXQoQ1BVU3RhdGUgKmNzLCB1
aW50NjRfdCByZXQpCiAgICAgZW52LT5ncHJbeEEwXSA9IHJldDsKIH0KIAordm9pZCBjb21tb25f
c2VtaV9zZXRfZXJyKENQVVN0YXRlICpjcywgaW50IGVycikKK3sKK30KKwogYm9vbCBpc182NGJp
dF9zZW1paG9zdGluZyhDUFVBcmNoU3RhdGUgKmVudikKIHsKICAgICByZXR1cm4gcmlzY3ZfY3B1
X214bChlbnYpICE9IE1YTF9SVjMyOwotLSAKMi4zNC4xCgo=

